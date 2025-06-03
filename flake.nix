{
  description = "NixOS configuration";

  inputs = {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen = {
      url = "github:/InioX/Matugen";
    };
  };

  outputs = { nixpkgs, chaotic, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        chaotic.nixosModules.default
        
        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }

        # Configuration
        ./modules           # Modules (Packages, Accounts...)
        ./hosts/nixkpp.nix  # Specific host configuration (GPU, Account, Timezone)

        ({ config, pkgs, inputs, ... }: {
          environment.systemPackages = with pkgs; [    
            inputs.matugen.packages.${system}.default
          ];
        })
      ];
    };
  };
}
