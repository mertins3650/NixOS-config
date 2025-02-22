{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
  };
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    swaylock = {
      enable = true;
    };
  };
  services.swayidle.enable = true;
}
