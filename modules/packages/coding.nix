{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    
    # Coding
    neovim    # Vim but better
    neovide   # DE for neovim 
    git       # Ler
    
    # Code utils
    cargo     # CAR GO
    nodejs    # Node.JS
    gcc       # GNU C Compiler
    cmake     # C Make

  ];

}
