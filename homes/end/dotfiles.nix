{ inputs, pkgs, ... }: {
  xdg.configFile = {
    xdg.configFile."starship.toml".source = "./.config/starship.toml";
  };
}
