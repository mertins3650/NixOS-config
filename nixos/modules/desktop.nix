{ config, pkgs, ... }: {

  services.xserver.enable = false;
  programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;


fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.cascadia-code
    nerd-fonts.cascadia-mono
];

  environment.systemPackages = with pkgs; [
    fuzzel
    libsForQt5.dolphin
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

