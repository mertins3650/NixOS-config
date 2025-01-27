{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    eza
    pkgs.ghostty
    oh-my-zsh
    tmux
    yazi
    zoxide
    zsh
  ];
}

