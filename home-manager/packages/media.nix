{ pkgs, lib, ... }: {
  
  home.packages = with pkgs; [
  
    # Media
    mpv       # Video player
    vlc       # Video player #2
    kew       # Audio player
    spotify   # Online audio player
    gimp      # GNU Image Manipulation Tool
    krita     # Art and draw software
  
  ];
}
