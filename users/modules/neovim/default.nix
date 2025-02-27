{ pkgs, ... }:
{

  home.packages= with pkgs; [
  lazygit
  neovim
  lua
  luarocks
  lua-language-server
  ];

}
