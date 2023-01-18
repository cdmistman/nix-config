{
  description = "My (cdmistman/colton) Nix configurations.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, darwin, home-manager, ... }: {
    darwinConfigurations.donn-mbp = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/donn-mbp/default.nix
        # ./hosts/donn-mbp.nix
        # ./modules/home-manager.nix
      ];
    };
  };
}
