let
  username = "end";
  homeDirectory = "/home/end";
in {
  imports = [
    ./ags.nix
    ./anyrun.nix
    ./blackbox.nix
    ./browser.nix
    ./bspwm.nix
    ./dconf.nix
    ./hyprland.nix
    ./mimelist.nix
    ./packages.nix
    # ./sh.nix
    # ./starship.nix
    ./sway.nix
    ./theme.nix
    ./wezterm.nix
  ];

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${homeDirectory}/.local/share/go"; # you can use xdg.cacheHome here
      GOMODCACHE = "${homeDirectory}/.cache/go/pkg/mod"; # "
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = [
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/.config/ags"
    "file://${homeDirectory}/.config/hypr"
    "file://${homeDirectory}/Documents/GitHub"
    "file:///mnt/Windows"
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; # this must be the version at which you have started using the program
}
