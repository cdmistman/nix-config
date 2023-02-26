{ pkgs, ... }: {
	programs.zsh = {
		enable = true;

		autocd = false;

		defaultKeymap = "viins";

		enableAutosuggestions = true;
		enableSyntaxHighlighting = true;

		# profileExtra = ''
		# 	# because i'm sick of setting this every time i run darwin-rebuild
		# 	export NIXPKGS_ALLOW_UNFREE=1
		# 	# export PAGER="bat "
		# 	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
		# '';

		oh-my-zsh = {
			enable = true;
			plugins = [
				"vi-mode"
			];
		};

		plugins = [
			{
				name = "zsh-nix-shell";
				file = "nix-shell.plugin.zsh";
				src = pkgs.fetchFromGitHub {
					owner = "chisui";
					repo = "zsh-nix-shell";
					rev = "v0.5.0";
					sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
				};
			}
		];
	};
}
