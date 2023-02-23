{
  description = "My (cdmistman/colton) Nix configurations.";

  inputs = {
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, darwin, home-manager, nixpkgs, nixpkgs-unstable, ... }: let
		pkgs = system: import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
	in {
		darwinConfigurations = {
			donn-mbp = darwin.lib.darwinSystem (
				let
					system = "aarch64-darwin";
				in import ./mkSystem.nix {
					inherit inputs system;

					host = "donn-mbp";
					nixpkgs = nixpkgs-unstable;
					modules = [
						home-manager.darwinModules.home-manager
					];
				}
			);

			replit-mbp = darwin.lib.darwinSystem (
				let
					system = "aarch64-darwin";
				in import ./mkSystem.nix {
					inherit inputs system;

					host = "replit-mbp";
					nixpkgs = nixpkgs-unstable;
					modules = [
						home-manager.darwinModules.home-manager
					];
				}
			);
		};
	};
}
