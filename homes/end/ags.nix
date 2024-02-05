{ inputs, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    gtksourceview
    webkitgtk
    python311Packages.material-color-utilities
    sassc
    (python311.withPackages (p: [ p.python-pam ]))
  ];

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ../ags;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      python311Packages.material-color-utilities
      sassc
    ];
  };
}
