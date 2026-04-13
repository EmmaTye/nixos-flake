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

    filetype = {
      extension = {
          thy = "isabelle";
      };
    };

    autoCmd = [
      # Cornelis (Agda) commands
      {
        event = [ "BufRead" "BufNewFile" ];
        pattern = [ "*.agda" ];
        callback = { __raw = ''
          function()
            vim.keymap.set('n', '<leader>l', ':CornelisLoad<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>r', ':CornelisRefine<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>d', ':CornelisMakeCase<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>,', ':CornelisTypeContext<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>.', ':CornelisTypeContextInfer<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>n', ':CornelisSolve<CR>', { buffer = true })
            vim.keymap.set('n', '<leader>a', ':CornelisAuto<CR>', { buffer = true })
            vim.keymap.set('n', 'gd', ':CornelisGoToDefinition<CR>', { buffer = true })
            vim.keymap.set('n', '[/', ':CornelisPrevGoal<CR>', { buffer = true })
            vim.keymap.set('n', ']/', ':CornelisNextGoal<CR>', { buffer = true })
            vim.keymap.set('n', '<C-A>', ':CornelisInc<CR>', { buffer = true })
            vim.keymap.set('n', '<C-X>', ':CornelisDec<CR>', { buffer = true })
          end
        ''; };
      }
      {
        event = [ "QuitPre" ];
        pattern = [ "*.agda" ];
        callback = { __raw = ''
          function()
            vim.cmd('CornelisCloseInfoWindows')
          end
        ''; };
      }
      {
        event = [ "BufWritePost" ];
        pattern = [ "*.agda" ];
        callback = { __raw =  ''
          function()
            vim.cmd('normal! :CornelisLoad\<CR>')
          end
        ''; };
      }
      {
        event = [ "BufReadPre" ];
        pattern = [ "*.agda" ];
        callback = { __raw = ''
          function()
            if
              vim.fn.exists(':CornelisLoad') > 0
            then
              vim.cmd('CornelisLoad')
            end
          end
        ''; };
      }
    ];
  };
}

