{ config, lib, pkgs, ... }:
{
  options = {
    nvim.enable = lib.mkEnableOption "Enable Neovim";
  };

  config = lib.mkIf config.nvim.enable {
    environment.systemPackages = with pkgs; [
      lazygit
      neovim
      prettierd
      stylua
    ];
  };
}

