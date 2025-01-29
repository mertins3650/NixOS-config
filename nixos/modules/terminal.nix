{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    eza
    fzf
    pkgs.ghostty
    ripgrep
    tmux
    yazi
    zoxide
  ];
}

