{ config, ... }:

let 
  palette = config.colorScheme.colors;
in
{
  # base00= "#2E3440";
  # base01= "#3B4252";
  # base02= "#434C5E";
  # base03= "#4C566A";
  # base04= "#D8DEE9";
  # base05= "#E5E9F0";
  # base06= "#ECEFF4";
  # base07= "#8FBCBB";
  # base08= "#88C0D0";
  # base09= "#81A1C1";
  # base0A= "#5E81AC";
  # base0B= "#BF616A";
  # base0C= "#D08770";
  # base0D= "#EBCB8B";
  # base0E= "#A3BE8C";
  # base0F= "#B48EAD";
  programs.oh-my-posh = {
    enable = true;
    # useTheme = "peru";
    settings = builtins.fromJSON ''
      {

        "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        "blocks": [
          {
            "alignment": "left",
            "segments": [
              {
                "foreground": "#88C0D0",
                "style": "plain",
                "template": "{{ if .WSL }}WSL at {{ end }}{{.Icon}} ",
                "type": "os"
              },
              {
                "foreground": "#88C0D0",
                "foreground_templates": [
                  "{{ if .Env.IN_NIX_SHELL }}#D8DEE9{{ end }}"
                ],
                "style": "diamond",
                "template": "{{ if .Env.IN_NIX_SHELL }}nix-shell{{ else }}{{ .UserName }}{{ end }}@{{ .HostName }} ",
                "type": "session"
              },
              {
                "foreground": "#A3BE8C",
                "style": "powerline",
                "template": "\u279c \ue235({{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Major }}.{{ .Minor }}{{ end }}) ",
                "type": "python"
              },
              {
                "foreground": "#EBCB8B",
                "foreground_templates": [
                  "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#D08770{{ end }}",
                  "{{ if gt .Ahead 0 }}#A3BE8C{{ end }}",
                  "{{ if gt .Behind 0 }}#B48EAD{{ end }}"
                ],
                "properties": {
                  "fetch_status": true,
                  "fetch_upstream_icon": true
                },
                "style": "plain",
                "template": "{{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",
                "type": "git"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "right",
            "segments": [
              {
                "background": "#A3BE8C",
                "foreground": "#ECEFF4",
                "leading_diamond": "\ue0b6",
                "style": "diamond",
                "template": "\ue718 {{ .Full }} ",
                "trailing_diamond": "\ue0b4",
                "type": "node"
              },
              {
                "background": "#B48EAD",
                "foreground": "#ECEFF4",
                "leading_diamond": " \ue0b6",
                "style": "diamond",
                "template": "\ue738 {{ .Full }} ",
                "trailing_diamond": "\ue0b4",
                "type": "java"
              },
              {
                "properties": {
                  "always_enabled": true
                },
                "style": "plain",
                "template": " {{ if gt .Code 0 }}<#BF616A>\uf00d</>{{ else }}<#A3BE8C>\uf42e</>{{ end }} ",
                "type": "status"
              },
              {
                "foreground": "#EBCB8B",
                "properties": {
                  "threshold": 10
                },
                "style": "plain",
                "template": "took \uf252 {{ .FormattedMs }} ",
                "type": "executiontime"
              },
              {
                "foreground": "#5E81AC",
                "properties": {
                  "time_format": "15:04:05"
                },
                "style": "plain",
                "template": " {{ .CurrentDate | date .Format }} \uf017 ",
                "type": "time"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "left",
            "newline": true,
            "segments": [
              {
                "foreground": "#8FBCBB",
                "properties": {
                  "style": "full"
                },
                "style": "plain",
                "template": "{{ .Path }} ",
                "type": "path"
              },
              {
                "foreground": "#A3BE8C",
                "style": "plain",
                "template": "\u276f ",
                "type": "text"
              }
            ],
            "type": "prompt"
          }
        ],
        "version": 2
      }

    '';
  };
}
