{ pkgs, config, ... }:
let
  fastfetchConfig = pkgs.writeText "fastfetch.jsonc" ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json", 
      "logo": {
        "source": "nixos_small",
        "padding": {
          "top": 1
        }
      },
      "display": {
        "separator": "  "
      },
      "modules": [
        "break",
        "title",
        {
          "type": "os",
          "key": "os    ",
          "keyColor": "33"
        },
        {
          "type": "kernel",
          "key": "kernel",
          "keyColor": "33"
        },
        {
          "type": "host",
          "format": "{5} {1}",
          "key": "host  ",
          "keyColor": "33"
        },
        {
          "type": "packages",
          "format": "{} (nixpkgs)",
          "key": "pkgs  ",
          "keyColor": "33"
        },
        {
          "type": "uptime",
          "format": "{2}h {3}m",
          "key": "uptime",
          "keyColor": "33"
        },
        {
          "type": "memory",
          "key": "memory",
          "keyColor": "33"
        },
        "break"
      ]
    }
  '';
in
{
 
  home.file.".config/fastfetch/config.jsonc".source = fastfetchConfig;  
  home.packages = with pkgs; [
    fastfetch
  ];

} 
