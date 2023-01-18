{
  services.nix-daemon.enable = true;

  # TODO: pass nixpkgs to here to install nerd fonts
  # fonts = {
  #   fontDir.enable = true;
  #   fonts = [
  #     (nixpkgs.nerdfonts.override {
  #       fonts = [
  #         "FiraCode"
  #         "Hack"
  #       ];
  #     })
  #   ];
  # };

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    users.colton = import ../users/colton.nix;
  };

  programs = {
    bash.enable = false;
    zsh.enable = true;
  };
}
