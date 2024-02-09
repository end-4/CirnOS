{ config, impurity, inputs, pkgs, ... }: {

  xdg.configFile = {
    "starship.toml".source = impurity.link ./.config/starship.toml;
  };
}

