{ pkgs, ... }: {

  services.xserver.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  programs.hyprland.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  security.pam.services.sway.enableGnomeKeyring = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;

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

  environment.systemPackages = with pkgs; [
    nautilus
    hypridle
    hyprlock
    hyprpaper
    hyprshot
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

