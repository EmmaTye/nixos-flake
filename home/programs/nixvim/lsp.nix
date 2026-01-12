{
  programs.nixvim.lsp = {
    servers = {
      # haskell
      hls = {
        enable = true;
      };
      #ocaml
      ocamllsp = {
        enable = true;
      };
    };
  };
}

