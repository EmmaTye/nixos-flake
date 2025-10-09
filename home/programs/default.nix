{
  pkgs, lib, imports, ...
}:
{
  imports = [
    ./git.nix
    ./zsh.nix
    ./direnv.nix
    ./nixvim
  ];
}

