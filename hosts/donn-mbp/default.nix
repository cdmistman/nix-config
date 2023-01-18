{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  services.nix-daemon.package = pkgs.nixFlakes;

  programs.zsh.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.colton = { pkgs, ... }: {
    stateVersion = "22.11";

    programs.bash.enable = false;
    programs.bat.enable = true;
    programs.zsh.enable = true;
  };
}
