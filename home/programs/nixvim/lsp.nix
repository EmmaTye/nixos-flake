{
  programs.nixvim.lsp = {
    servers = {
      # haskell
      hls = {
        enable = true;
        package = null;
      };
      #ocaml
      ocamllsp = {
        enable = true;
      };
      # isabelle
      isabelle = {
        enable = true;
      };
    };
  };
}

