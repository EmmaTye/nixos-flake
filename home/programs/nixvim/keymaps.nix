{
  programs.nixvim = {
    keymaps = [
      {
        # Enable which-key list of Cornelis' agda-input
        mode = "i";
        key = "<localleader>";
        action = "<C-O>:call cornelis#prompt_input()<CR>";
      }
    ];
  };
}

