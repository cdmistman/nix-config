{
	programs.git = {
		enable = true;

		userEmail = "colton@donn.io";
		userName = "Colton Donnelly";

		aliases = {
			cam = "commit -am";
			ignore = "update-index --assume-unchanged";
			unignore = "update-index --no-assume-unchanged";
		};

		extraConfig = {
			init.defaultBranch = "main";
			push.autoSetupRemote = true;
			url."ssh://git@github.com".insteadOf = "github";
		};
	};
}
