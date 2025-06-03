{ pkgs, lib, config, ... }: {

  home.packages = with pkgs; [
    nwg-look
    papirus-icon-theme
    adw-gtk3
    bibata-cursors
  ];

  gtk = {
   enable = true;
   cursorTheme.package = pkgs.bibata-cursors;
   cursorTheme.name = "Bibata-Modern-Classic";

   iconTheme.package = pkgs.papirus-icon-theme;
   iconTheme.name = "Papirus-Dark";

   theme.package = pkgs.adw-gtk3;
   theme.name = "adw-gtk3-dark";
  };
 
}
