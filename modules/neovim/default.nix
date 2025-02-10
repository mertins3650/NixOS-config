{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  lazygit
  neovim
  clang
  gcc
  lua
  luajit
  luarocks
  lua-language-server
  ];
}
