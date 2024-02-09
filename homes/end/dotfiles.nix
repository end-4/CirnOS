{ config, impurity, inputs, pkgs, ... }: {
  # imports = [ impurity.nixosModules.impurity ];

  home.file =
    let
      symlink = impurity.link;
    in
    {
      ".config/starship.toml".source = symlink ./.config/starship.toml;

    };
}
