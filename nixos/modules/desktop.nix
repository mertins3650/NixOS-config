{ config, pkgs, ... }: {

  services.xserver.enable = false;
  programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Set dark mode as the default for GTK and Qt
  environment.variables = {
    GTK_THEME = "Adwaita-dark";          # For GTK apps
    QT_QPA_PLATFORMTHEME = "qt5ct";     # For Qt apps
    QT_STYLE_OVERRIDE = "Adwaita-dark"; # Apply Adwaita-dark to Qt apps
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
    lxappearance       # For GTK theme management
    libsForQt5.qt5ct
    ];
}

