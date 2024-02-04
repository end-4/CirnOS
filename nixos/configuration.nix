{ pkgs, username, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./audio.nix
    ./laptop.nix
    ./locale.nix
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # virtualisation
  # programs.virt-manager.enable = true;
  # virtualisation = {
  #   podman.enable = true;
  #   libvirtd.enable = true;
  # };

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

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = true;
    # flatpak.enable = true;
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
  users.users.${username} = {
    isNormalUser = true;
    extraGroups =
      [ "nixosvmtest" "networkmanager" "wheel" "audio" "video" "libvirtd" ];
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

  # bootloader
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
  };

  system.stateVersion = "23.11";
}
