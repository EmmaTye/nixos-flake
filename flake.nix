{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Windows Subsystem for Linux
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Note: the current pinned cornelis version on
    # nixpkgs is wildyly out of date, so using a custom
    # input & overlay to get the correct cornelis version
    cornelis = {
      url = "github:agda/cornelis";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self
                     , nixpkgs
                     , nixos-wsl
                     , home-manager
                     , nixvim
                     , cornelis
                     , ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
	# Windows Subsystem for Linux as a NixOS module
        nixos-wsl.nixosModules.default {
          system.stateVersion = "25.05";
          wsl.enable = true;
        }

	# home-manager as a NixOS module	
        home-manager.nixosModules.home-manager {
          # Note: the current pinned cornelis version on
          # nixpkgs is wildyly out of date, so using a custom
          # input & overlay to get the correct cornelis version
          nixpkgs.overlays = [cornelis.overlays.cornelis];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./home;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }

        # System-wide configuration
        ./system.nix
      ];
    };
  };
}

