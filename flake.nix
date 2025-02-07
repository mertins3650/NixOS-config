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

  outputs = { self, nixpkgs,... }@inputs:
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
          specialArgs = {inherit inputs system;};
          system = "x86_64-linux";
          modules = [
            ./systems/oldlaptop.nix
            ./default.nix
          ];
        };
      };
    };
}

