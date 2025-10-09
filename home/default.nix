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

    packages = with pkgs; [
      zip
      unzip
      jq
    ];
  };
}

