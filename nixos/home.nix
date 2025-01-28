{ config, pkgs, ... }:

{
  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  home.file = {
  };
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
