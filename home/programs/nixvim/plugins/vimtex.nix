{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    # Use local texlive package
    texlivePackage = null;
    settings = {
      view_method = "general";
      view_general_viewer = "sumatraPDF";
      view_general_options = "-reuse-instance @pdf";
    };
  };
}

