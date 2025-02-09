{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
  lazygit
  neovim
prettierd
  stylua
  ];
}
