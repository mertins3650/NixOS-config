{ config, pkgs, ... }:

{
  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  gtk.enable = true;
  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  home.packages = [
  pkgs.oh-my-zsh       
  pkgs.zsh

  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

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
