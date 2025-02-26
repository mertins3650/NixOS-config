{ pkgs, ... }: {

  services.xserver.enable = false;
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

  environment.systemPackages = with pkgs; [
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

