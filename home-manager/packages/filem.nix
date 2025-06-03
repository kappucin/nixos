{ pkgs, lib, ... }: {

  home.packages = with pkgs; [

    # File management
    mc        # Midnight commander
    nnn       # VIM File browser
    yazi      # Better than ranger
    ranger    # Cool CLI file manager
    nemo      # GUI File manager

  ];
}
