{ lib, ... }:
with lib; let
  customToINI = generators.toINI {
    # specifies how to format a key/value pair
    mkKeyValue = generators.mkKeyValueDefault
      {
        # specifies the generated string for a subset of nix values
        mkValueString = v:
          if v == true then ''yes''
          else if v == false then ''no''
          else if isString v then ''${v}''
          # and delegats all other values to the default generator
          else generators.mkValueStringDefault { } v;
      } " = ";
  };
  system_colors = import ./../themes/gruvbox/system_color_picker.nix;
in
{
  xdg.configFile."polybar/config.ini".text = customToINI {
    "bar/desktopbottombar" = {
      modules-left = "i3";
      modules-right = "battery wireless-network wired-network cpu memory pulseaudio my_date";
      bottom = true;
      font-0 = "FiraCode Nerd Font Mono:size=13;4";
      font-1 = "RobotoMono Nerd Font Mono:style=Medium,Regular:size=13;4";
      background = "${system_colors.terminal.background}";
      tray-position = "none";
      border-top-size = 5;
      border-bottom-size = 5;
      border-left-size = 4;
      border-right-size = 4;
      border-color = "${system_colors.terminal.background}";
      module-margin = "2px";
    };

    "module/i3" = {
      type = "internal/i3";
      show-urgent = true;
      enable-click = false;
      enable-scroll = false;
      label-unfocused-padding-right = 1;
      label-focused-padding-right = 1;
      label-focused-foreground = "${system_colors.custom.white}";
      label-focused-background = "${system_colors.terminal.color4}";
      label-unfocused-foreground = "${system_colors.terminal.background}";
      label-unfocused-background = "${system_colors.custom.white}";
    };

    "module/battery" = {
      "type" = "internal/battery";
      "poll-interval" = "60";
      label = "%{T2}󱐥%{T-}";
    };

    "module/cpu" = {
      type = "internal/cpu";
      label = "%{T2}%{T-} %percentage%%";
      interval = 3.0;
      label-padding = 1;
      label-background = "${system_colors.custom.white}";
      label-foreground = "${system_colors.terminal.background}";
    };

    "module/memory" = {
      type = "internal/memory";
      label = "RAM %percentage_used%%";
      interval = 3.0;
      label-background = "${system_colors.custom.white}";
      label-foreground = "${system_colors.terminal.background}";
      label-padding = 1;
      border-right-size = 4;
    };

    "module/wireless-network" = {
      type = "internal/network";
      interface = "wlp3s0";
      interval = "5.0";

      format-connected = "<label-connected>";
      label-connected = "Wifi %downspeed%";
      label-connected-background = "${system_colors.terminal.color14}";
      label-connected-foreground = "${system_colors.terminal.background}";
      label-connected-padding = 1;
    };

    "module/wired-network" = {
      type = "internal/network";
      interface = "enp5s0";
      interval = "5.0";

      format-connected = "<label-connected>";
      label-connected = "Wired %downspeed%";
      label-connected-background = "${system_colors.terminal.color14}";
      label-connected-foreground = "${system_colors.terminal.background}";
      label-connected-padding = 1;
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";
      click-right = "pavucontrol";
      format-muted = "%{T2}ﱝ%{T-} <label-volume>";
      format-muted-background = "${system_colors.custom.white}";
      format-muted-foreground = "${system_colors.terminal.color1}";
      format-volume = "%{T2}墳%{T-} <label-volume>";
      format-volume-background = "${system_colors.custom.white}";
      format-volume-foreground = "${system_colors.terminal.background}";
      format-volume-padding = 1;
      format-muted-padding = 1;
    };

    "module/my_date" = {
      type = "custom/script";
      exec = ''"date +%H\:%M\ \-\ %a\ %d\.%b"'';
      interval = 15;
      click-right = "gnome-clocks";
      label-background = "${system_colors.custom.white}";
      label-foreground = "${system_colors.terminal.background}";
      label-padding = 1;
    };
  };
}
