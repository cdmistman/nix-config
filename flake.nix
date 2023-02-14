{
  description = "My (cdmistman/colton) Nix configurations.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, darwin, home-manager, nixpkgs, ... }: let
		pkgs = system: import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
	in {
		# overlays = import ./overlays { inherit self inputs; };
		darwinConfigurations.donn-mbp = darwin.lib.darwinSystem {
			inputs = inputs // { pkgs = pkgs "aarch64-darwin"; };

			system = "aarch64-darwin";
			modules = [
				home-manager.darwinModules.home-manager
				./hosts/donn-mbp.nix
				./users/colton.nix
				{ home-manager.extraSpecialArgs.pkgs = pkgs "aarch64-darwin"; }
			];
		};

		darwinConfigurations.replit-mbp = darwin.lib.darwinSystem {
			inputs = inputs // { pkgs = pkgs "aarch64-darwin"; };

			system = "aarch64-darwin";
			modules = [
				home-manager.darwinModules.home-manager
				./hosts/replit-mbp.nix
				./users/colton.nix
				{ home-manager.extraSpecialArgs.pkgs = pkgs "aarch64-darwin"; }
			];
		};
	};
}
