{ ... }:
{
  programs = {
    sway = {
      enable = true;
    };
    swaylock = {
      enable = true;
    };
  };
  services.swayidle.enable = true;
}
