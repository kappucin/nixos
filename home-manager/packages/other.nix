{ pkgs, lib, config, ... }: {

  home.packages = with pkgs; [
    # Notify 
    mako 
    libnotify
  ];

}
