{
  pkgs,
  lib,
  userSettings,
  config,
  ...
}: let
  bgImageSection = name: ''
    #${name} {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"));
    }
  '';
  palette = config.colorScheme.palette;
in {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "sleep 1; hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "sleep 1; hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "sleep 1; systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }

    ];

    # TODO: Add dynamic colored icons
    style = ''
      * {
        font-family: ${userSettings.font} NF;
        background-image: none;
        transition: 20ms;
      }

      window {
        background-color: rgba(12, 12, 12, 0.1);
      }
      button {
        color: #${palette.base06};
        font-size:20px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border-style: solid;
        background-color: rgba(12, 12, 12, 0.3);
        border: 3px solid #${palette.base06};
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }

      button:focus,
      button:active,
      button:hover {
        color: #${palette.base0C};
        background-color: rgba(12, 12, 12, 0.5);
        border: 3px solid #${palette.base0C};
      }

      ${lib.concatMapStringsSep "\n" bgImageSection [
        "lock"
        "logout"
        "suspend"
        "hibernate"
        "shutdown"
        "reboot"
      ]}
    '';
  };
}
