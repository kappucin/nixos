{ pkgs, lib, ... }: {

   fonts.packages = with pkgs; [

    # Maple Mono
    maple-mono.truetype
    maple-mono.NF-unhinted
    maple-mono.NF-CN-unhinted

    # JetBrains Mono
    jetbrains-mono

    # Fira Code
    fira-code

  ];

}
