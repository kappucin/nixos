{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    
    # Gaming
    steam     # VALVE Gaming tool
    lutris    # Game launche

  ];

}
