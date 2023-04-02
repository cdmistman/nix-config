{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		devenv = {
			url = "github:cachix/devenv";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		fenix = {
			url = "github:nix-community/fenix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		flake-parts.url = "github:hercules-ci/flake-parts";
	};

	outputs = inputs @ {
		flake-parts,
		...
	}:
		flake-parts.lib.mkFlake { inherit inputs; } {
			imports = [
				inputs.devenv.flakeModule
			];

			systems = [
				"aarch64-darwin"
			];

			perSystem = { lib, pkgs, system, ... }: let
				darwinFrameworks = lib.attrValues (
					lib.filterAttrs
						(k: _: k != "QuickTime" && k != "QTKit")
						pkgs.darwin.apple_sdk.frameworks
				);
			in {
				devenv.shells.rust = {
					packages = darwinFrameworks ++ [
						pkgs.cargo-deny
						pkgs.cmakeMinimal
					];

					env.CPATH = pkgs.lib.makeSearchPath "include" [
						pkgs.darwin.libobjc
					];

					env.LIBRARY_PATH = pkgs.lib.makeLibraryPath [
						pkgs.darwin.libobjc
						pkgs.iconv
						pkgs.llvmPackages.libcxxabi
					];

					languages.rust.enable = true;
				};
			};
		};
}
