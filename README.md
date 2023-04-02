# nix-config

These are my personal nix configurations for development in repositories that do not have a nix dev shell set up. For example, when I tried to develop for [starship](https://github.com/starship/starship) I had to set up my own nix dev shell. To use a shell that's sufficient for running `cargo run` in the starship repo, I can run `nix develop github:cdmistman/nix-config#rust`. The idea is to make shells that are as generic as possible, but eventually I'll probably have to make more specific shells for specific projects.

## Shell List

Note that, as of this moment, all shells use [devenv](https://devenv.sh) to manage the shell environment.

### rust

`nix develop github:cdmistman/nix-config#rust`

This shell is sufficient for running `cargo run` in a rust project. It includes the standard rust toolchain, `rust-analyzer`, and `cargo-deny`. It also includes `cmake` since that is occasionnally required for building rust projects. On darwin (the only platform I've tested the shell with), it includes some system libraries.
