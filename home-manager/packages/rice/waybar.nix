{ config, pkgs, lib, ... }:
{

  programs.waybar = {
   enable = true;
   style = ''
    * {
    font-family: "ZedMono Nerd Font";
    font-weight: 700;
    font-size: 20px;
}

window#waybar {
    color: #4d23cf;
    background-color: #f7e1fb;
    border-right: 3px solid #4d23cf;
}

#workspaces {
    margin: 2px 7px 2px 4px;
    color: #4d23cf;
}

#workspaces button {
    border: none;
    padding: 10px 1px 9px 1px;
    color: #4d23cf;
    border-top: 3px solid rgba(0, 0, 0, 0);
    border-left: 3px solid rgba(0, 0, 0, 0);
    border-bottom: 3px solid rgba(0, 0, 0, 0);
    border-right: 3px solid rgba(0, 0, 0, 0);
    border-radius: 0;
}

#workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
    background: none;
}

#workspaces button.active {
    color: #4d23cf;
    border-bottom: 3px solid #815cdd;
    border-right: 3px solid #815cdd;
    border-top: 3px solid #ffffff;
    border-left: 3px solid #ffffff;
}

#workspaces button.urgent {
    color: #d164f3;
}

#custom-launcher {
    border: none;
    background-color: #f7e1fb;
    padding: 2px 8px 2px 0px;
    margin: 4px 7px 2px 4px;
    font-size: 32px;
    border-bottom: 3px solid #815cdd;
    border-right: 3px solid #815cdd;
    border-top: 3px solid #ffffff;
    border-left: 3px solid #ffffff;
    color: #4d23cf;
}

#custom-separator {
    font-size: 0;
    padding: 0.5px;
    background-color: #f7e1fb;
    margin: 4px 11px 4px 8px;
    border-bottom: 1px solid #4d23cf;
    border-right: 1px solid #4d23cf;
    border-left: 1px solid #ffffff;
    border-top: 1px solid #ffffff;
}

#custom-addworkspace {
    border: none;
    margin: 2px 7px 2px 4px;
    font-size: 24px;
    color: #4d23cf;
    padding: 8px 4px 8px 0px;
}
'';
   settings = {
    programs.waybar.settings = [
    {
      layer = "top";
      position = "left";
      width = 62;
      modules-left = [
        "custom/launcher"
        "custom/separator"
        "hyprland/workspaces"
        "custom/addworkspace"
      ];

      tray = {
        icon-size = 22;
        spacing = 10;
      };

      "custom/separator" = {
        format = " ";
        tooltip = false;
      };

      "custom/addworkspace" = {
        on-click = "angelctl new_workspace";
        format = "";
        tooltip = false;
      };

      "custom/launcher" = {
        on-click = "angelctl launcher";
        format = "󰐂";
        tooltip = false;
      };
    }
  ];
   };
  };
    
}
