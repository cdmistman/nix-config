{ host, inputs, modules, nixpkgs, system }:
let
	pkgs = import nixpkgs {
		inherit system;

		config = {
			allowUnfree = true;
		};
	};
in {
	inherit system;

	inputs = inputs // {
		inherit pkgs;
	};

	modules = modules ++ [
		./hosts/${host}.nix
		./users/colton.nix
		{
			home-manager.extraSpecialArgs = {
				inherit pkgs;
			};
		}
	];
}
