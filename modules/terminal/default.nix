{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

