{ ... }:
{
  wayland.windowManager.Sway = {
    enable = true;
  };
  services.swayidle.enable = true;
  programs.swaylock.enable = true;
}
