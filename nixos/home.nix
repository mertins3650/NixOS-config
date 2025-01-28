{ config, pkgs, ... }:

{
  home.username = "simonm";
  home.homeDirectory = "/home/simonm";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Define your home packages here
  home.packages = [
    # Add any additional packages you need
  ];

  # Set environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Zsh configuration
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}

