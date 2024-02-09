let
  username = "end";
  homeDirectory = "/home/end";
in
{ pkgs, impurity, ... }: {
  imports = [
    # Cachix
    # ./cachix.nix
    ## Dotfiles (manual)
    ./dotfiles.nix
    # Stuff
    ./ags.nix
    ./anyrun.nix
    ./browser.nix
    ./dconf.nix
    ./hyprland.nix
    ./mimelist.nix
    ./packages.nix
    # ./starship.nix
    ./sway.nix
    ./theme.nix
  ];

  home = {
    inherit username homeDirectory;
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  xdg.userDirs = {
    createDirectories = true;
  };

  gtk = {
    font = {
      name = "Rubik";
      package = pkgs.google-fonts.override { fonts = [ "Rubik" ]; };
      size = 11;
    };
    gtk3 = {
      bookmarks = [
        "file://${homeDirectory}/Downloads"
        "file://${homeDirectory}/Documents"
        "file://${homeDirectory}/Pictures"
        "file://${homeDirectory}/Music"
        "file://${homeDirectory}/Videos"
        "file://${homeDirectory}/.config"
        "file://${homeDirectory}/.config/ags"
        "file://${homeDirectory}/.config/hypr"
        "file://${homeDirectory}/GitHub"
        "file:///mnt/Windows"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
  home.stateVersion = "23.11"; # this must be the version at which you have started using the program
}
