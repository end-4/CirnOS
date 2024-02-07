{ inputs, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    ollama
    pywal
    sassc
    (python311.withPackages (p: [
      p.material-color-utilities
    ]))
  ];

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ../ags;

    extraPackages = with pkgs; [
      gtksourceview
      gtksourceview4
      ollama
      python311Packages.material-color-utilities
      pywal
      sassc
      webkitgtk
      ydotool
    ];
  };
}
