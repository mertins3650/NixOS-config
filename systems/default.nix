
{inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
        experimental-features = [ "nix-command" "flakes" ];
    };

  # steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOL_PATHS = 
            "/home/user/.steam/root/compabilitytools.d";
    };


  imports =
    [ 
      ../modules
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  services.xserver.xkb = {
    layout = "dk";
    variant = "";
  };

  console.keyMap = "dk-latin1";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
};


  users.users.simonm = {
    isNormalUser = true;
    description = "Simon Mertins";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  curl
  git
  gh
  libpng
  protonup
  wget
  pkgs.home-manager
  qmk
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
