{ pkgs, ... }:
{

  home.packages = with pkgs; with nodePackages_latest; with gnome; with libsForQt5; [
    sway
    # keyboard
    # fcitx5-with-addons
    # fcitx5-unikey

    # gui
    blueberry
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    d-spy
    dolphin
    kolourpaint
    qt5.qtimageformats
    github-desktop
    gnome.nautilus
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
    cliphist
    fuzzel
    grim
    hyprpicker
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock-effects
    swayidle
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
    # very important stuff
    # uwuify
  ];
}
