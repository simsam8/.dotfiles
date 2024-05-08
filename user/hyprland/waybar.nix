{ pkgs, lib, config, userSettings, ... }:

let
  palette = config.colorScheme.colors;
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in with lib; {
  home.packages = with pkgs; [
    waybar
  ];

  imports = [ ./wlogout.nix ];

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "top";
      modules-center = [ "hyprland/workspaces" ];
      modules-left = [ "custom/startmenu"  "hyprland/window" "pulseaudio" "cpu" "memory" "disk" ]; # "hyprland/mode" ];
      modules-right = [ "custom/exit" "idle_inhibitor" "bluetooth" "hyprland/language" "battery" "network" "clock" "tray" ];

      "hyprland/language" = {
        format = "󰌌 {short}{variant}";
        on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
      };
      "hyprland/workspaces" = {
        format = "{name}";
        format-icons = {
          default = " ";
          active = " ";
          urgent = " ";
        };
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
      };

      "clock" = {
        format = " {:L%H:%M}"; #24 hour format
        tooltip = true;
        tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
      };

      "hyprland/window" = {
        max-length = 25;
        separate-outputs = false;
        rewrite = { "" = " No Window "; };
      };

      "memory" = {
        interval = 5;
        format = " {}%";
        tooltip = true;
      };


      "cpu" = {
        interval = 5;
        format = " {usage:2}%";
        tooltip = true;
      };

      "disk" = {
        format = " {free}";
        tooltip = true;
      };

      "network" = {
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        format-ethernet = "󰈁";
        format-wifi = "{icon} {signalStrength}% {essid}";
        format-disconnected = "󰤮";
        tooltip = true;
        tooltip-format = "Connected to: {essid}\n {bandwidthUpBytes}\n {bandwidthDownBytes}";
        on-click = "networkmanager_dmenu";
        # on-click = "nm-applet --indicator";
      };

      "tray" = {
        spacing = 12;
      };

      "pulseaudio" = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = "  {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "sleep 0.1 && pavucontrol";
      };

      "custom/exit" = {
        tooltip = false;
        format = "";
        on-click = "sleep 0.1 && wlogout";
      };

      "custom/startmenu" = {
        tooltip = false;
        format = " "; 
        on-click = "sleep 0.1 && fuzzel";
      };

      # "custom/hyprbindings" = {
      #   tooltip = false;
      #   format = " Bindings";
      #   on-click = "sleep 0.1 && list-hypr-bindings";
      # };

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
            activated = "";
            deactivated = "";
        };
        tooltip = "true";
      };
 
      "custom/notification" = {
        tooltip = false;
        format = "{icon} {}";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = "";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        # exec-if = "which swaync-client";
        # exec = "swaync-client -swb";
        # on-click = "sleep 0.1 && task-waybar";
        escape = true;
      };


      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󱘖 {capacity}%";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        on-click = "";
        tooltip = false;
      };

      "bluetooth" = {
        format = "󰂯";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-on = "󰂯";
        format-connected = "󰂱";
        tooltip-format-connected = "{device_alias}";
        tooltip-format-enumerate-connected = "{device_alias}";
        tooltip-format-disabled = "Bluetooth Disabled";
        tooltip-format-on = "Bluetooth Enabled";
        tooltip-format-off = "Bluetooth Off";
        on-click = "blueman-manager";
      };
    }];

    style = concatStrings [''
      * {
        font-size: 16px;
        font-family: ${userSettings.font} Nerd Font;
        font-weight: bold;
      }
      window#waybar {
        background-color: #${palette.base00};
        border-bottom: 1px solid rgba(26, 27, 38, 0);
        border-radius: 0px;
        color: #${palette.base0F};
      }
      #workspaces {
        background: #${palette.base01};
        margin: 2px;
        padding: 0px 1px;
        border-radius: 15px;
        border: 0px;
        font-style: normal;
        color: #${palette.base00};
      }
      #workspaces button {
        padding: 0px 5px;
        margin: 4px 3px;
        border-radius: 10px;
        border: 0px;
        color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
        background-size: 300% 300%;
        opacity: 0.5;
        transition: ${betterTransition};
      }
      #workspaces button.active {
        padding: 0px 5px;
        margin: 4px 3px;
        border-radius: 10px;
        border: 0px;
        color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
        background-size: 300% 300%;
        transition: ${betterTransition};
        opacity: 1.0;
        min-width: 40px;
      }
      #workspaces button:hover {
        border-radius: 10px;
        color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
        background-size: 300% 300%;
        opacity: 0.8;
        transition: ${betterTransition};
      }
      @keyframes gradient_horizontal {
        0% {
          background-position: 0% 50%;
        }
        50% {
          background-position: 100% 50%;
        }
        100% {
          background-position: 0% 50%;
        }
      }
      @keyframes swiping {
        0% {
          background-position: 0% 200%;
        }
        100% {
          background-position: 200% 200%;
        }
      }
      tooltip {
        background: #${palette.base00};
        border: 1px solid #${palette.base0E};
        border-radius: 10px;
      }
      tooltip label {
        color: #${palette.base07};
      }
      #window {
        margin: 4px;
        padding: 2px 10px;
        color: #${palette.base05};
        background: #${palette.base01};
        border-radius: 10px;
      }
      #memory {
        color: #${palette.base0F};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #clock {
        color: #${palette.base01};
          background: linear-gradient(45deg, #${palette.base0C}, #${palette.base0F}, #${palette.base0B}, #${palette.base08});
          background-size: 300% 300%;
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #cpu {
        color: #${palette.base07};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #disk {
        color: #${palette.base07};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #battery {
        color: #${palette.base08};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #bluetooth {
        color: #${palette.base07};
        background: #${palette.base01};
        margin: 4px 0px 4px 0px;
        padding: 2px 15px;
        border-radius: 0px 10px 10px 0px;
      }
      #network {
        color: #${palette.base09};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #tray {
        color: #${palette.base05};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #pulseaudio {
        color: #${palette.base0D};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #custom-notification {
        color: #${palette.base0C};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #custom-startmenu {
        color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base09}, #${palette.base03}, #${palette.base0C}, #${palette.base07});
        background-size: 300% 300%;
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
      #idle_inhibitor {
        color: #${palette.base09};
        background: #${palette.base01};
        margin: 4px 0px;
        padding: 2px 14px;
        border-radius: 0px;
      }
      #custom-exit {
        color: #${palette.base0E};
        background: #${palette.base01};
        border-radius: 10px 0px 0px 10px;
        margin: 4px 0px;
        padding: 2px 5px 2px 15px;
      }
      #language {
        color: #${palette.base0F};
        background: #${palette.base01};
        margin: 4px;
        padding: 2px 10px;
        border-radius: 10px;
      }
    ''];
  };

  home.file.".config/networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = fuzzel --dmenu
    compact = True
    wifi_icons = 󰤯󰤟󰤢󰤥󰤨
    format = {icon} {name} {sec} 
    list_saved = True
    active_chars = ->
  '';

}
