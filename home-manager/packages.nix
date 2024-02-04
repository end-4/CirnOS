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
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
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
    jq
    gojq
    acpi
    ffmpeg
    libnotify
    killall
    zip
    unzip
    glib
    foot
    kitty
    starship
    vscode
    ydotool

    # theming tools
    gradience
    gnome-tweaks

    # hyprland
    brightnessctl
    fuzzel
    grim
    hyprpicker
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock
    slurp
    swww
    wayshot
    wlsunset
    wl-clipboard
    wf-recorder

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
