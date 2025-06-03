{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [

    # Terminal
    foot      # FooTerminal
    jq        # JSON terminal
    doas      # Sudo alternative
    lolcat    # LOL CAT!!
    tree      # View tree of files
    fastfetch # Cool fetch
  ];

}
