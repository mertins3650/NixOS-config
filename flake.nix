{
  description = "My system flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        oldlaptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system self; }; 
          system = "x86_64-linux";
          modules = [
            ./systems/oldlaptop.nix
            ./systems/default.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                extraSpecialArgs = { inherit inputs self; }; 
                users.simonm = import "${self}/users/simonm.nix";
              };
            }
          ];
        };
        zenbook = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system self; };
          system = "x86_64-linux";
          modules = [
            ./systems/zenbook.nix
            ./systems/default.nix
            home-manager.nixosModules.home-manager {
              home-manager = {
                extraSpecialArgs = { inherit inputs self; }; 
                users.simonm = import "${self}/users/simonm.nix";
              };
            }
          ];
        };
      };
    };
}

