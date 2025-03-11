{ pkgs, ... }:
{

  home.packages= with pkgs; [
    lazygit
    neovim
    lua
    luarocks
  ];

}
