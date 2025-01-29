{ config, pkgs, ... }: {

  services.xserver.enable = false;
  programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;


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
    lxappearance       # For GTK theme management
    libsForQt5.qt5ct
    ];
}

