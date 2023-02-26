{
	programs.skim = {
		enable = true;
		enableZshIntegration = true;

		defaultCommand = "fd --type f || find .";
		defaultOptions = [
			"--preview"
			"bat --color=always --style=numbers --line-range=:500 {}"
		];
	};
}
