{ config, pkgs, ... }:

{
  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; # Please read the comment before changing.

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

  home.packages = [
  pkgs.zsh
  pkgs.oh-my-zsh       
  pkgs.zoxide
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
        ls = "eza -1 --group-directories-first --icons";
        cd = "z";
        };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
        };
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
  };


programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
};

  programs.git = {
    enable = true;
    userName = "Simon Mertins";
    userEmail = "mertins99@gmail.com";
  };

  #home.file = {
  #  ".config/nvim" = {
  #    source = config.lib.file.mkOutOfStoreSymlink /home/simonm/NixOS-config/nixos/dotfiles/config/nvim;
  #  };
  #};
home.file = {
  "nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/simonm/NixOS-config/nixos/dotfiles/nvim/";
  };
};



  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
