{
  config,
  pkgs,
  ...
}: {
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    systemPackages = with pkgs; [
      gnome-extension-manager
      nautilus-open-any-terminal
      morewaita-icon-theme
      bibata-cursors
      rubik
      gnome.nautilus-python
      twitter-color-emoji
    ];

    gnome.excludePackages =
      (with pkgs; [
        # gnome-text-editor
        # gnome-console
        gedit # text editor
        gnome-photos
        gnome-tour
        gnome-connections
        snapshot
      ])
      ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        epiphany # web browser
        geary # email reader
        evince # document viewer
        # gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        yelp # Help view
        gnome-contacts
        gnome-initial-setup
        gnome-shell-extensions
        gnome-maps
        # gnome-font-viewer
      ]);
  };

  # services.xserver = {
  #   displayManager.gdm.enable = true;
  #   desktopManager.gnome = {
  #     enable = true;
  #     extraGSettingsOverridePackages = [
  #         pkgs.nautilus-open-any-terminal
  #     ];
  #   };
  # };

  programs.dconf.profiles = {
    gdm.databases = [
      {
        settings = {
          "org/gnome/desktop/peripherals/touchpad" = {
            tap-to-click = true;
          };
          "org/gnome/desktop/interface" = {
            cursor-theme = "Bibata-Modern-Classic";
          };
        };
      }
    ];
  };
}
