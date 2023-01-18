{ pkgs, ... }: {
  services.nix-daemon.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
        ];
      })
    ];
  };

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs = {
    bash.enable = false;
    zsh.enable = true;
  };
}
