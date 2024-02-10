{ config, impurity, inputs, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      "nrb" = "IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake . --impure";
    };
  };
  xdg.configFile = let link = impurity.link; in {
    "ags".source = link ./.config/ags;
    # "fish".source = link ./.config/fish;
    "foot".source = link ./.config/foot;
    "fuzzel".source = link ./.config/fuzzel;
    "mpv".source = link ./.config/mpv;
    "thorium-flags.conf".source = link ./.config/thorium-flags.conf;
    "starship.toml".source = link ./.config/starship.toml;
  };
}

