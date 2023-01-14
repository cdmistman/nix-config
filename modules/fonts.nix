{ nixpkgs, ... }: {
  fonts = {
    fontDir.enable = true;

    fonts = with nixpkgs; [
      (nerdfonts.override {
        fonts = [
          "Hack"
          "FiraCode"
        ];
      })
    ];
  };
}
