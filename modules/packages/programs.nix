{ pkgs, lib, ... }: {

  programs = {

   fish.enable = true; # Fish
   hyprland.enable = true; # Niri
   firefox.enable = true; # Firefox
   adb.enable = true; # ADB (Android Debugging Bridge)

  };

}
