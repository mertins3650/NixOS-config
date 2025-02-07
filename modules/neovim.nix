{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  lazygit
  neovim
  pkgs.prettierd
  stylua
  ];
}
