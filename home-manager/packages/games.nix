{ pkgs, config, ... }: {
 
  home.packages = with pkgs; [
   ddnet
  ];

}
