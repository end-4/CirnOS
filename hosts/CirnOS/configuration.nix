{ pkgs, username, config, ... }: {
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
    envfs.enable = true;
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
    pam.services.swaylock = { };
    # pam.services.swaylock-effects = {};
  };

  # dconf
  programs = {
    zsh.enable = true;
    fish.enable = true;
    dconf.enable = true;
    firefox.nativeMessagingHosts.packages = [ pkgs.plasma5Packages.plasma-browser-integration ];
  };
  # packages
  environment = {
    localBinInPath = true;
    systemPackages = with pkgs; [
      curl
      zsh
      fish
      git
      gh
      # home-manager
      wget
      nixpkgs-fmt
      nixfmt
    ];
  };

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
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "video" "input" "uinput" "libvirtd" ];
    };
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
