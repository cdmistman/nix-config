{
  description = "My (cdmistman/colton) Nix configurations.";

  inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { darwin, ... }: let
		mkSystem = import ./mkSystem.nix inputs;
	in {
		darwinConfigurations = {
			donn-mbp = mkSystem.darwin {
				system = "aarch64-darwin";

				modules = [
					{
						nix.settings.trusted-users = [ "root" "colton" ];
					}
					(import ./users/colton.nix {
						homeDirectory = "/Users/colton";

						imports = [
							./programs/vscode.nix
						];
					})
				];
			};

			replit-mbp = mkSystem.darwin {
				system = "aarch64-darwin";

				modules = [
					(import ./users/colton.nix {
						homeDirectory = "/home/colton";

						imports = [
							./programs/vscode.nix
						];
					})
				];
			};
		};
	};
}
