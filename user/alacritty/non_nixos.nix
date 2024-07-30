{ config, ... }:

with config.colorScheme.colors; {
  home.file.".config/alacritty/alacritty.toml".text = ''
    [window]
    padding = { x = 5, y = 5 }
    dynamic_padding = true
    opacity = 0.75

    [font]
    normal = { family = "RobotoMono Nerd Font", style = "Regular" }
    bold = { family = "RobotoMono Nerd Font", style = "Bold" }
    italic = { family = "RobotoMono Nerd Font", style = "Italic" }
    bold_italic = { family = "RobotoMono Nerd Font", style = "Bold Italic" }

    [cursor]
    style = { shape = "Underline", blinking = "Off" }

    [colors]

    cursor = { cursor = "#${base06}", text = "#${base00}" }

    [colors.primary]
    background = "#${base00}"
    foreground = "#${base06}"

    [colors.bright]
    black = "#${base03}"
    blue = "#${base0D}"
    cyan = "#${base0C}"
    green = "#${base0B}"
    magenta = "#${base0E}"
    red = "#${base08}"
    white = "#${base06}"
    yellow = "#${base09}"

    [colors.normal]
    black = "#${base00}"
    blue = "#${base0D}"
    cyan = "#${base0C}"
    green = "#${base0B}"
    magenta = "#${base0E}"
    red = "#${base08}"
    white = "#${base06}"
    yellow = "#${base0A}"

  '';
}
