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
				./services/nix-daemon.nix
				./system/common.nix
				./system/darwin.nix

				home-manager.darwinModules.home-manager
			];


			specialArgs = {
				# for some reason the passed `pkgs` doesn't allow
				# unfree packages - this is a workaround
				inherit pkgs;

				username = "colton";
			};
		});
}
