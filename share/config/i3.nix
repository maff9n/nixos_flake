{ lib, pkgs, ... }:
let
  mod = "Mod1";
  wallpaper = ../design/images/wallpaper02.png;
  screensaver = ../design/images/wallpaper01.png;
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      window.titlebar = true;

      keybindings = lib.mkOptionDefault {
        ###
        ### Modes
        ###
        "${mod}+Shift+e" = "mode \"(L)ogout, (R)eboot, (P)oweroff\"";
        "${mod}+Shift+r" = "restart";
        "${mod}+s" = "mode \">> Shortcuts\"";
        ###
        ### Workstation config
        ###
        "${mod}+Shift+1" = "move container to workspace number $ws1";
        "${mod}+Shift+2" = "move container to workspace number $ws2";
        "${mod}+Shift+3" = "move container to workspace number $ws3";
        "${mod}+Shift+4" = "move container to workspace number $ws4";
        "${mod}+Shift+5" = "move container to workspace number $ws5";
        "${mod}+Shift+6" = "move container to workspace number $ws6";
        "${mod}+Shift+7" = "move container to workspace number $ws7";
        "${mod}+Shift+8" = "move container to workspace number $ws8";
        "${mod}+Shift+9" = "move container to workspace number $ws9";
        "${mod}+1" = "workspace number $ws1";
        "${mod}+2" = "workspace number $ws2";
        "${mod}+3" = "workspace number $ws3";
        "${mod}+4" = "workspace number $ws4";
        "${mod}+5" = "workspace number $ws5";
        "${mod}+6" = "workspace number $ws6";
        "${mod}+7" = "workspace number $ws7";
        "${mod}+8" = "workspace number $ws8";
        "${mod}+9" = "workspace number $ws9";
        ###
        ### Window config
        ###
        "${mod}+Return" = "exec kitty";
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+q" = "kill";
        "${mod}+a" = "focus parent";
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        ###
        ### Screen arrangement
        ###
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+c" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+r" = ''mode "resize"'';
        ###
        ### Floating config
        ###

        ###
        ### Special keys
        ###
        "${mod}+0" = "exec i3lock -i ${screensaver}";

        #WEBCAM
        #bindsym $mod+X exec floating_webcam    
        #for_window [title="/dev/video0"] floating enable
        #for_window [title="/dev/video0"] sticky enable
        #for_window [title="/dev/video0"] move right 1024                     
        #for_window [title="/dev/video0"] move down 533                       
        ##for_window [title="/dev/video0"] move up 560
      };

      modes = {
        "(L)ogout, (R)eboot, (P)oweroff" = {
          r = "exec --no-startup-id systemctl reboot";
          l = "exit";
          p = "exec --no-startup-id systemctl poweroff";
          Return = "mode \"default\"";
          Escape = "mode \"default\"";
        };
        "Screenshot of: (W)hole Page, (R)egion" = {
          r = "--release exec i3-msg mode \"default\" && mkdir -p ~/Pictures/screenshots && import ~/Pictures/screenshots/$(date '+%y%m%d%H%M%S').png";
          w = "exec i3-msg mode \"default\" && sleep 0.1 && mkdir -p ~/Pictures/screenshots && import -window root ~/Pictures/screenshots/$(date '+%y%m%d%H%M%S').png";
          Return = "mode \"default\"";
          Escape = "mode \"default\"";
        };
        resize = {
          h = "resize shrink width 5 px or 5 ppt";
          j = "resize grow height 5 px or 5 ppt";
          k = "resize shrink height 5 px or 5 ppt";
          l = "resize grow width 5 px or 5 ppt";
          Left = "resize shrink width 10 px or 10 ppt";
          Down = "resize grow height 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          Right = "resize grow width 10 px or 10 ppt";
          Return = "mode \"default\"";
          Escape = "mode \"default\"";
        };
      };
    };

    extraConfig = ''
      for_window [class="Spotify"] floating enable
      for_window [class="Spotify"] resize set $(echo "$width * 0.8") $(echo "$height * 0.5")

      client.focused          #4c7899 #285577 #ffffff #2e9ef4 #309ff2

      default_border pixel 3

      mode ">> Shortcuts" {
          bindsym 1 exec firefox ; mode "default"
          bindsym 9 mode "Screenshot of: (W)hole Page, (R)egion"
          bindsym 3 exec signal-desktop ; mode "default"
          bindsym 7 exec spotify ; mode "default"

          # back to normal: Enter or Escape
          bindsym Return mode "default"
          bindsym Escape mode "default"
      }

      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"

      focus_follows_mouse no

      exec_always pkill -9 polybar ; pkill -9 i3bar ; polybar desktopbottombar
      exec_always feh --bg-scale ${wallpaper}

      assign [class="Thunderbird"] 9
      # exec_always thunderbird
      # exec_always feh --bg-scale ${wallpaper}
    '';
  };
}
