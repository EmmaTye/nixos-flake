{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.kanagawa.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
    };
  };
}

