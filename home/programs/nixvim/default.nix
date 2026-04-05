{
  inputs, pkgs, ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    ./lsp.nix
    ./plugins
    ./options.nix
  ];

  programs.nixvim = {
    extraPackages = [ pkgs.cornelis ];
    extraPlugins = [ pkgs.vimPlugins.cornelis ];
    extraConfigLua = "vim.g.cornelis_use_global_binary = 1";
  };
}

