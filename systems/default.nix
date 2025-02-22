{inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
        experimental-features = [ "nix-command" "flakes" ];
    };

  imports =
    [ 
      ./modules
      ../modules
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  services.printing.enable = true;
  services.polkit.enable = true;
  security.pam.swaylock = {};

  system.stateVersion = "24.11"; # Did you read the comment?

}
