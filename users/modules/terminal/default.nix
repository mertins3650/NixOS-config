{ pkgs, ... }:

{
  home.packages= with pkgs; [
    eza
    fzf
    ghostty
    ripgrep
    yazi
    clang
    gcc
    luajit
  ];
}

