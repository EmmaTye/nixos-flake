{
  inputs, ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./plugins
    ./options.nix
  ];
}

