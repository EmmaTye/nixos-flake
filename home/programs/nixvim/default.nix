{
  inputs, ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
  ];
}

