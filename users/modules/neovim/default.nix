{ lib, pkgs, ... }:
{

  home.packages= with pkgs; [
  lazygit
  neovim
  clang
  gcc
  lua
  luajit
  luarocks
  lua-language-server
  ];

  home.activation.createSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rm -rf ~/.config/nvim
      mkdir -p ~/.config/nvim
      ln -s /home/simonm/NixOS-config/dotfiles/nvim/* ~/.config/nvim/
  '';
}
