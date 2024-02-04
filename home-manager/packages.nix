{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with nodePackages_latest; with gnome; [
    sway
    # colorscript
    (import ./colorscript.nix { inherit pkgs; })

    # gui
    blueberry
    (mpv.override { scripts = [mpvScripts.mpris]; })
    d-spy
    kolourpaint
    github-desktop
    icon-library
    dconf-editor
    figma-linux
    yad

    # tools
    bat
    eza
    fd
    ripgrep
    fzf
    socat
    jq gojq
    acpi
    ffmpeg
    libnotify
    killall
    zip unzip
    glib
    foot kitty starship
    vscode
    ydotool

    # hyprland
    fuzzel
    wlsunset
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    grim
    slurp
    imagemagick
    pavucontrol
    brightnessctl
    swaylock
    swww

    # langs
    nodejs
    gjs
    bun
    cargo
    go
    gcc
    typescript
    eslint
  ];
}
