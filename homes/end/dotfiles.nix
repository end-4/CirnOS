{ config, impurity, inputs, pkgs, ... }: {
  # imports = [ impurity.nixosModules.impurity ];

  # xdg.configFile = let symlink = impurity.link; in {
  #   "starship.toml".source = symlink ./.config/starship.toml;
  # };
}

