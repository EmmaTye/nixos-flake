{config, pkgs, inputs, ...}:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    zip
    unzip
    jq
  ];

  programs.git = {
    enable = true;
    userName = "EmmaTye";
    userEmail = "tyelouiseemma@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.bash = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
    };
    colorschemes.kanagawa = {
      enable = true;
    };
    plugins.lspconfig = {
      enable = true;
    };
    plugins.idris2 = {
      enable = true;
      settings = {
        server = {
	  on_attach = {
	  # TODO: remap idris lua funs
	    __raw = ''
	      function(client)
	      end
	    '';
	  };
	};
      };
    };
    plugins.nui = {
      enable = true;
    };
  };

  home.stateVersion = "25.05";
}

