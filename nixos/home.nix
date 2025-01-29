{ config, pkgs, ... }:

{
  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  gtk.enable = true;
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  home.packages = [
  pkgs.zsh
  pkgs.oh-my-zsh       
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
  };


  programs.zoxide.enableZshIntegration = true;

  programs.git = {
    enable = true;
    userName = "Simon Mertins";
    userEmail = "mertins99@gmail.com";
  };


  home.file = {
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
