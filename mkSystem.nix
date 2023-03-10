inputs @ {
	darwin,
	home-manager,
	nixpkgs,
	...
}: {
	darwin = ({ imports ? [], modules ? [], system }: let
			pkgs = import nixpkgs {
				inherit system;

				config.allowUnfree = true;
			};
		in darwin.lib.darwinSystem {
			inherit inputs pkgs system;

			modules = modules ++ [
				./modules/darwin/nix-darwin-applications.nix
				./services/nix-daemon.nix
				./system/common.nix
				./system/darwin.nix

				home-manager.darwinModules.home-manager
				{
					programs.nix-index.enable = true;
				}
			];


			specialArgs = {
				# for some reason the passed `pkgs` doesn't allow unfree packages
				inherit pkgs;

				username = "colton";
			};
		});
}
