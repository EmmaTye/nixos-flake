{
  inputs, ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymaps.nix
    ./lsp.nix
    ./plugins
    ./options.nix
  ];
}

