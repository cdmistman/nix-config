{
  description = "My (cdmistman/colton) Nix configurations.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, darwin, home-manager, nixpkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    darwinConfigurations.donn-mbp = darwin.lib.darwinSystem {
			inherit inputs;

      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/donn-mbp.nix
				./users/colton.nix
      ];
    };
  };
}
