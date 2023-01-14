inputs @ { nixpkgs, ... }: with nixpkgs; {
  rake = dir:
    builtins.mapAttrs
      (k: v: {
        name = lib.strings.removeSuffix ".nix" k;
        value = builtins.import (dir + "/${k}");
      })
      (builtins.removeAttrs (builtins.readDir dir) [ "default.nix" ]);
}
