{ inputs, pkgs, ... }:
{
  imports = [
    inputs.anyrun.homeManagerModules.anyrun-with-all-plugins
  ];

  programs.anyrun = {
    enable = true;
  };
}
