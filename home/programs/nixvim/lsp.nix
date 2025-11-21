{
  programs.nixvim.lsp = {
    servers = {
      # haskell
      hls = {
        enable = true;
        config = {
          filetypes = ["haskell" "lhaskell" "cabal"];
        };
      };
    };
  };
}

