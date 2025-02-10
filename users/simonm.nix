{ config, pkgs, lib, ... }:

let
    devcommitScript = import ../scripts/dev-commit.nix { pkgs = pkgs; };
    tmux-sessionizerScript = import ../scripts/tmux-sessionizer.nix { pkgs = pkgs; };
in

{
  imports =
    [ 
      ./modules
    ];

    home.username = "simonm";
    home.homeDirectory = "/home/simonm";
    home.stateVersion = "24.11"; # Please read the comment before changing.
    
    home.packages = [
        devcommitScript
        tmux-sessionizerScript 
        pkgs.zsh
        pkgs.oh-my-zsh       
        pkgs.zoxide
        pkgs.libnotify
        pkgs.swaynotificationcenter
        pkgs.nh
    ];

    gtk.theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome.gnome-themes-extra;
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };

    qt.enable = true;
    qt.platformTheme.name = "gtk";
    qt.style.name = "adwaita-dark";
    qt.style.package = pkgs.adwaita-qt;
    
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
    zsh = {
        enable = true;
        shellAliases = {
            ls = "eza -1 --group-directories-first --icons";
            cd = "z";
        };
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = ["direnv"];
        };
        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
    };
  };

    home.file = {};

    home.activation.createSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        rm -rf ~/.config/nvim
        mkdir -p ~/.config/nvim
        ln -s /home/simonm/NixOS-config/dotfiles/nvim/* ~/.config/nvim/
    '';

     xdg.configFile = {
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

    xdg.configFile = {
      "swaync/style.css" = {
        source = ../dotfiles/swaync/style.css;
      };
    };

    programs.home-manager.enable = true;
}

