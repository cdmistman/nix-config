{
	homeDirectory,
	imports ? [],
}: {
	home-manager.users.colton = { pkgs, ... }: {
		imports = imports ++ [
			../modules/editorconfig.nix

			../programs/bash.nix
			../programs/bat.nix
			../programs/bottom.nix
			../programs/direnv.nix
			../programs/gh.nix
			../programs/git.nix
			../programs/lsd.nix
			../programs/neovim.nix
			../programs/skim.nix
			../programs/starship.nix
			../programs/tealdeer.nix
			../programs/zellij.nix
			../programs/zoxide.nix
			../programs/zsh.nix
		];

		home = {
			enableNixpkgsReleaseCheck = true;
			stateVersion = "22.11";
			username = "colton";

			packages = with pkgs; [
				du-dust
				fd
				helix
				procs
				ripgrep
				sd
				tokei
			];

			sessionPath = [
				"$HOME/bin"
			];

			sessionVariables = {
				NIXPKGS_ALLOW_UNFREE = 1;
				MANPAGER = "sh -c 'col -bx | bat -l man -p'";
				PAGER = "bat";
			};

			shellAliases = {
				k = "clear";
				kn = "clear && printf '\\e[3J'";
				ls = "lsd -A --group-directories-first --hyperlink auto";
				l = "ls";
				la = "ls -a";
				ll = "ls -l";
				tree = "lsd -L --tree";
			};
		};

		programs.alacritty.enable = true;
		programs.command-not-found.enable = true;
	};
}
