{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [

   # Audio
   pavucontrol   # GUI pipewire control center
   pamixer       # Audio manager

   # Other
   wl-clipboard  # Clipboard manager
   cava          # Terminal audio visualiser

  ];

}
