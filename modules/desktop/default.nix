{ pkgs, ... }:
{

  services.xserver.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.caskaydia-cove
  ];
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };

  environment.systemPackages = with pkgs; [
    nautilus
    grim
    slurp
    swayidle
    swaylock
    fuzzel
    pavucontrol
    waybar
    wayland
    wayland-protocols
    wl-clipboard
    xwayland
    lxappearance
    libsForQt5.qt5ct
  ];
}
