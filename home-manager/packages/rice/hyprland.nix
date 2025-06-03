{ config, pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    
    settings = {
      # Variables
      "$mod" = "SUPER";
      "$left" = "h";
      "$down" = "j";
      "$up" = "k";
      "$right" = "l";
      "$filexp" = "nemo";
      "$terminal" = "foot";
      "$menu" = "rofi";

      # Monitor configuration
      monitor = [
        "HDMI-A-1,1920x1080@75,0x0,1"
        ",preferred,auto,1"
      ];

      # Input configuration
      input = {
        sensitivity = 0;
        follow_mouse = 1;
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
      };

      # General settings
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 0;
        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration
      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };

      # Group configuration
      group = {
        groupbar = {
          enabled = false;
          stacked = false;
          priority = 10001;
          render_titles = false;
          keep_upper_gap = true;
          gaps_in = 0;
          gaps_out = 0;
          indicator_height = 10;
          rounding = 5;
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 80%"
          "windowsIn, 1, 3, md3_decel, popin 80%"
          "windowsOut, 1, 3, md3_accel, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 0.5, menu_accel"
          "workspaces, 1, 3, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
    # Animation configs

      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Misc
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      layerrule = [
        "blur, waybar"
        "blur, rofi"
        "blur, notifications"
        "ignorezero, notifications"
        "ignorezero, rofi"
      ];

      # Window rules
      windowrule = [
        "float, class:^(org.pulseaudio.pavucontrol)$"
        "float, class:^(nemo)$"
      ];

      # Key bindings
      bind = [
        # Basic bindings
        "$mod, Return, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, E, exec, $filexp"
        "$mod, D, exec, $menu -show drun"
        "$mod, F, togglefloating"
        "$mod, T, fullscreen"
        
        # Movement
        "$mod, $left, movefocus, l"
        "$mod, $down, movefocus, d"
        "$mod, $up, movefocus, u"
        "$mod, $right, movefocus, r"

        "$mod SHIFT, $left, movewindow, l"
        "$mod SHIFT, $down, movewindow, d"
        "$mod SHIFT, $up, movewindow, u"
        "$mod SHIFT, $right, movewindow, r"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        # Move container to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Mouse wheel workspace switching
      binde = [
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      # Audio binds
      bindel = [
        ", XF86AudioRaiseVolume, exec, /home/kppcn/Scripts/volume.sh --inc"
        ", XF86AudioLowerVolume, exec, /home/kppcn/Scripts/volume.sh --dec"
      ];

      # Startup applications
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 24"
        "swww-daemon"
        "mako"
        "waybar"
        "blueman-applet"
      ];

      # Environment variables
      env = [
        #"XCURSOR_THEME,capitaine-cursors"
        #"XCURSOR_SIZE,16"
      ];
    };
  };
}
