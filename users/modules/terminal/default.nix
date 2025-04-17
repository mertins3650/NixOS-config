{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide
    eza
    fzf
    ghostty
    ripgrep
    yazi
  ];
}
