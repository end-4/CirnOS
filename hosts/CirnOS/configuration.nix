{ pkgs
, username
, config
, ...
}: {
  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # virtualisation
  # programs.virt-manager.enable = true;
  # virtualisation = {
  #   libvirtd.enable = true;
  # };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    gvfs.enable = true;
    envfs.enable = true;
    xserver = {
      enable = true;
      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = [
          pkgs.nautilus-open-any-terminal
        ];
      };
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # dconf
  programs.dconf.enable = true;
  # packages
  environment.systemPackages = with pkgs; [
    curl
    fish
    git
    gh
    home-manager
    wget
    nixpkgs-fmt
    nixfmt
  ];

  # ZRAM
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';
  # user
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "nixosvmtest" "networkmanager" "wheel" "audio" "video" "libvirtd" ];
  };

  # network
  networking = {
    hostName = "CirnOS";
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # Boot
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "btrfs" "ext4" "fat32" "ntfs" ];
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;
    # extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    # kernelModules = [ "acpi_call" ];

    # make 3.5mm jack work
    # extraModprobeConfig = ''
    #   options snd_hda_intel model=headset-mode
    # '';
  };

  system.stateVersion = "23.11";
}
