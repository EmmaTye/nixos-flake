{
  pkgs, lib, inputs, ...
}:
{
  imports = [
    ./programs
  ];

  # Let home-manager manage itself
  programs.home-manager.enable = true;
  
  home = {
    stateVersion = "25.05";
    
    username = "nixos";
    homeDirectory = "/home/nixos";

    sessionPath = [
      # SumatraPDF for use with VimTex
      "/mnt/c/Users/cxb25165/AppData/Local/SumatraPDF"
    ];

    packages = with pkgs; [
      zip
      unzip
      jq
      pympress
    ];
  };
}

