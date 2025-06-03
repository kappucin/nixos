{ config, pkgs, ... }:

{

  imports = [
     # Rice
     ./packages/rice/waybar.nix     # Waybar
     ./packages/rice/hyprland.nix   # Hyprland
     ./packages/rice/foot.nix       # Terminal
     ./packages/rice/starship.nix   # Starship shell
     
     # Theming
     ./theme/gtk.nix                # GTK Themes, Cursors
     #./theme/matugen.nix           # Matugen 

     # Group packages
     ./packages/other.nix           # Other packages
     ./packages/social.nix          # Social Networking
     ./packages/games.nix           # Games 
     ./packages/media.nix           # Media utils
     ./packages/filem.nix           # File explorers

     # Other
     ./packages/fetch.nix           # Fastfetch config
     ./packages/fish.nix            # Fish config
  ];

  home.username = "kppcn";
  home.homeDirectory = "/home/kppcn";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    rofi
    emacs  
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.git = {
    enable = true;
    userName  = "kappucin";
    userEmail = "stepankluzev01@gmail.com";
  };

  programs.home-manager.enable = true;
}
