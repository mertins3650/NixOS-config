{
  description = "My system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
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
        myNixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit system;};
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
    };
}

