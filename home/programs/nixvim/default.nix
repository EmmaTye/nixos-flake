{
  inputs, pkgs, ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./lsp.nix
    ./plugins
    ./options.nix
  ];

  programs.nixvim = {
    extraPackages = [ pkgs.cornelis ];
    extraPlugins = [ 
      pkgs.vimPlugins.cornelis
      (pkgs.vimUtils.buildVimPlugin {
        name = "isabelle";
        src = pkgs.fetchFromGitHub {
            owner = "Treeniks";
            repo = "isabelle-lsp.nvim";
            # Commit hash/tag
            rev = "3601b59d77cc4998de29f966ded7d4d959318be2";
            # SRI hash of github tar:
            # nix-prefetch-url --type sha256 --unpack https://github.com/<owner>/<repo>/archive/<rev>.tar.gz
            # nix hash convert --hash-algo sha256 --to sri <sha256 hash from above>
            hash = "sha256-2SijIavooMFft9S/fMcH/YE77wctAP0Oneg/YAR9+LM=";
        };
      })
    ];
    globals = {
      cornelis_use_global_binary = "1";
    };
  };
}

