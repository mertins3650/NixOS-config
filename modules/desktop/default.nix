{ pkgs, ... }: {

  services.xserver.enable = false;
  programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
  services.swayidle.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock
    fuzzel
    hypridle
    hyprlock
    hyprpaper
    hyprshot
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

