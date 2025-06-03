{ config, pkgs, lib, ... }: {

  imports = [

   # Boot
   ./boot.nix              # Bootloader, Linux

   # Services
   ./services.nix          # Services

   # Packages
   ./packages/coding.nix   # Code utils
   ./packages/fonts.nix    # Fonts
   ./packages/games.nix    # Games
   ./packages/media.nix    # Media utils (video, music)
   ./packages/programs.nix # Programs enabled by programs.enable
   ./packages/terminal.nix # Terminal tools
  ];

}
