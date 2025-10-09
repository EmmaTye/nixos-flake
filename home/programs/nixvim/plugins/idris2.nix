{
  programs.nixvim.plugins.idris2 = {
    enable = true;
    settings.server.on_attach = {
      # TODO: remap idris2 lua functions
      __raw = ''
        function(client)
        end
      '';
    };
  };
}

