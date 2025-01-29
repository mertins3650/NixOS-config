{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    eza
    fzf
    pkgs.ghostty
    ripgrep
    pkgs.oh-my-zsh       
    tmux
    yazi
    zoxide
  ];
}

