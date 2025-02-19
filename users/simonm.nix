{ config, pkgs, ... }:

let
    devcommitScript = import ../scripts/dev-commit.nix { pkgs = pkgs; };
    tmux-sessionizerScript = import ../scripts/tmux-sessionizer.nix { pkgs = pkgs; };
    devinitScript = import ../scripts/devinit.nix { pkgs = pkgs; };
in

{
  imports =
    [ 
      ./modules/defualt.nix
    ];

  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; 
  
  home.packages = [
    devinitScript
    devcommitScript
    tmux-sessionizerScript 
    pkgs.zoxide
    pkgs.libnotify
    pkgs.swaynotificationcenter
    pkgs.nh
  ];
    
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    nh = {
      enable = true;
      flake = "/home/simonm/NixOS-config/";
    };
    git = {
        enable = true;
        userName = "Simon Mertins";
        userEmail = "mertins99@gmail.com";
    };
    zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
  };

  home.file = {};

  xdg.configFile = {
    "swaync/style.css" = {
      source = ../dotfiles/swaync/style.css;
    };
    "ghostty/config".text = builtins.readFile ../dotfiles/ghostty/config;
    fuzzel = {
      source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS-config/dotfiles/fuzzel";
      recursive = true;
    };
    hypr = {
      source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS-config/dotfiles/hypr";
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
