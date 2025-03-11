{ pkgs, ... }:
{

  home.packages = with pkgs; [
    lazygit
    luajit
    neovim
    luarocks
  ];

}
