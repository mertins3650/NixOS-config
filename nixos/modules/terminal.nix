{ config, pkgs, ... }:
{


  environment.systemPackages = with pkgs; [
    eza
    fzf
    pkgs.ghostty
    oh-my-zsh
    ripgrep
    tmux
    yazi
    zoxide
    zsh
  ];
}

