{ self, ... }:
let
  inherit (self) inputs;
  inherit (inputs) nixpkgs home-manager;

  # set the entrypoint for home-manager configurations
  homeDir = self + /homes;
  # create an alias for the home-manager nixos module
  hm = home-manager.nixosModules.home-manager;

  # if a host uses home-manager, then it can simply import this list
  homes = [
    homeDir
    hm
  ];
  impurity = inputs.impurity;
in
{
  "CirnOS" = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules =
      [
        {
          # Impurity
          imports = [ impurity.nixosModules.impurity ];
          impurity.configRoot = self;
          impurity.enable = true;
        }

        ./CirnOS # this imports your entire host configuration in one swoop

        # this part is basically the same as putting configuration in your
        # configuration.nix, but is done on the topmost level for your convenience
        {
          networking.hostName = "CirnOS";
          _module.args = { username = "end"; };
        }
      ]
      ++ homes; # imports the home-manager related configurations
  };
  "CirnOS-impure" = self.nixosConfigurations."CirnOS".extendModules { modules = [{ impurity.enable = true; }]; };
}
