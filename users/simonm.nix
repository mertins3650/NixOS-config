{ config, pkgs, ... }:

let
  tmux-sessionizerScript = import ../scripts/tmux-sessionizer.nix { pkgs = pkgs; };
in

{
  imports = [
    ./modules/defualt.nix
  ];

  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "25.05";

  home.packages = [
    tmux-sessionizerScript
    pkgs.gh
    pkgs.libnotify
    pkgs.swaynotificationcenter
    pkgs.nh
  ];

  programs = {
    nh = {
      enable = true;
      flake = "/home/simonm/NixOS-config/";
    };
    git = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.file = { };

  xdg.configFile = {
    "swaync/style.css" = {
      source = ../dotfiles/swaync/style.css;
    };
    "ghostty/config".text = builtins.readFile ../dotfiles/ghostty/config;
    "sway/config".text = builtins.readFile ../dotfiles/sway/config;
    "sway/catppuccin-mocha".text = builtins.readFile ../dotfiles/sway/catppuccin-mocha;
    fuzzel = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-config/dotfiles/fuzzel";
      recursive = true;
    };
    waybar = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS-config/dotfiles/waybar";
      recursive = true;
    };
  };

  home.activation.createSymlink = ''
    rm -rf ~/.config/nvim
    mkdir -p ~/.config/nvim
    ln -s /home/simonm/NixOS-config/dotfiles/nvim/* ~/.config/nvim/
  '';

  home.sessionVariables = {
    EDITOR = "nvim";
    PATH = "$HOME/go/bin:$PATH";
  };

  programs.home-manager.enable = true;
}
