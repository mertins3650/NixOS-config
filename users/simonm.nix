{ config, lib,  pkgs, ... }:

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
    "sway/config".text = builtins.readFile ../dotfiles/sway/config;
    "sway/catppuccin-mocha".text = builtins.readFile ../dotfiles/sway/catppuccin-mocha;
    fuzzel = {
      source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS-config/dotfiles/fuzzel";
      recursive = true;
    };
    waybar = {
      source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/NixOS-config/dotfiles/waybar";
      recursive = true;
    };
  };

  home.activation.createSymlink = ''
    rm -rf ~/.config/hypr ~/.config/nvim
    mkdir -p ~/.config/hypr ~/.config/nvim
    ln -s /home/simonm/NixOS-config/dotfiles/hypr/* ~/.config/hypr/
    ln -s /home/simonm/NixOS-config/dotfiles/nvim/* ~/.config/nvim/
    sudo docker run -d --restart unless-stopped -p "127.0.0.1:3306:3306" --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8.4
    sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
  '';


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
