{ config, impurity, inputs, pkgs, ... }: {
  # imports = [ impurity.nixosModules.impurity ];

  xdg.configFile = {
    "starship.toml".source = impurity.link ./.config/starship.toml;
  };
}

