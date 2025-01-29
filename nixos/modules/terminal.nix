{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

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

