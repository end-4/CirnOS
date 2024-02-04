{
  imports = [
    ./audio.nix
    ./hardware-configuration.nix
    ./configuration.nix
    ./gnome.nix
    ./laptop.nix
    ./locale.nix
    # FIXME: move your hardware-configuration.nix here
    # and import it as well
  ];
}
