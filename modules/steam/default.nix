{ ... }:
{
  # steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOL_PATHS = 
            "/home/user/.steam/root/compabilitytools.d";
    };
}
