{
  catppuccin.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "/home/hacky/nixdots/scripts/startup.sh"
      ];

      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "us";
        kb_options = "caps:ctrl";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
        };
      };

      general = {
        gaps_in = 10;
        gaps_out = 25;
        border_size = 2;
        layout = "master";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      scrolling = {
        fullscreen_on_one_column = true;
      };

      decoration = {
        rounding = 15;
        active_opacity = 0.98;
        inactive_opacity = 0.80;

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          brightness = 0.95;
        };
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slidevert"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      gestures = {
        gesture = "3, vertical, workspace";
        workspace_swipe_invert = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      ## -- Main Bind -- ##
      "$mod" = "SUPER";

      # --- The Binds --- #
      bind = [
        ## --- Main Binds --- ##
        "$mod, B, exec, brave"
        "$mod, E, exec, microsoft-edge-stable"
        "$mod, L, exec, noctalia-shell ipc call lockScreen lock"
        # "$mod, O, swapsplit, # dwindle"
        "$mod, P, pseudo, # dwindle"
        "$mod, Q, killactive "
        "$mod, R, exec, noctalia-shell ipc call launcher toggle"
        "$mod, S, exec, /home/hacky/nixdots/scripts/screenshot.sh"
        "$mod, T, exec, ghostty"
        "$mod, V, togglefloating, q"
        "$mod, W, exit"
        "$mod, Y, exec, signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland"

        # Move focus with mainMod + arrow keys
        "$mod SHIFT, left, movefocus, l"
        "$mod SHIFT, right, movefocus, r"
        "$mod SHIFT, up, movefocus, u"
        "$mod SHIFT, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod CTRL, 1, workspace, 1"
        "$mod CTRL, 2, workspace, 2"
        "$mod CTRL, 3, workspace, 3"
        "$mod CTRL, 4, workspace, 4"
        "$mod CTRL, 5, workspace, 5"
        "$mod CTRL, 6, workspace, 6"
        "$mod CTRL, 7, workspace, 7"
        "$mod CTRL, 8, workspace, 8"
        "$mod CTRL, 9, workspace, 9"
        "$mod CTRL, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "alt, mouse:272, movewindow"
        "alt, mouse:273, resizewindow"
      ];
      bindel = [
        ## Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl --class=backlight set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl --class=backlight set 10%-"

        #Volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
  };
}
