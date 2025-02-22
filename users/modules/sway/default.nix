{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
  };
  programs = {
    swaylock = {
      enable = true;
    };
  };
  services.swayidle.enable = true;
}
