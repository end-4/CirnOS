{ config, inputs, pkgs, ... }: let 
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file = {
    ".config/starship.toml".source = symlink ./.config/starship.toml;
  };
}
