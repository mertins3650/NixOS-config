
{ config, pkgs, ... }:
{

  services.xserver.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = false;
  programs.hyprland.enable = true;

    gnome = {
  settings = {
    enable = true;
    default = {
      "org.gnome.desktop.interface" = {
        gtk-theme = "Adwaita-dark";
        color-scheme = "prefer-dark";
      };
    };
  };
};

    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "CascadiaCode" "CascadiaMono" ]; })
    ];

  environment.systemPackages = with pkgs; [
    fuzzel
    libsForQt5.dolphin
    nerdfonts
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprshot
    pavucontrol
    waybar
    wayland
    wayland-protocols
    wl-clipboard
    xwayland
  ];
}
