
{inputs,  config, pkgs, ... }:

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
      ./hardware-configuration.nix
      ./modules/cleanup.nix
      ./modules/docker.nix
      ./modules/languages.nix
      ./modules/neovim.nix
      ./modules/terminal.nix
      ./modules/desktop.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      simonm = import ./home.nix;
    };
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
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

  hardware.pulseaudio.enable = false;
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

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  curl
  git
  gh
  libpng
  protonup
  wget
  pkgs.home-manager
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
