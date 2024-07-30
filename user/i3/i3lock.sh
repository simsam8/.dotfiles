#!/usr/bin/env bash

alpha='dd'
background='#2E3440'
selection='#4C566A'
comment='#5E81AC'

yellow='#EBCB8B'
orange='#D08770'
red='#BF616A'
magenta='#B48EAD'
blue='#5E81AC'
cyan='#88C0D0'
green='#A3BE8C'

# i3lock-color \
i3lock \
  --insidever-color=$selection$alpha \
  --insidewrong-color=$selection$alpha \
  --inside-color=$selection$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --keyhl-color=$magenta$alpha \
  --bshl-color=$orange$alpha \
  --separator-color=$selection$alpha \
  --verif-color=$green \
  --wrong-color=$red \
  --modif-color=$red \
  --layout-color=$blue \
  --date-color=$blue \
  --time-color=$blue \
  --screen 1 \
  --blur 1 \
  --clock \
  --indicator \
  --keylayout 0 \
  --time-str="%H:%M:%S" \
  --date-str="%A %e %B %Y" \
  --verif-text="Checking..." \
  --wrong-text="Wrong key" \
  --noinput="No Input" \
  --lock-text="Locking..." \
  --lockfailed="Lock Failed" \
  --radius=140 \
  --ring-width=10 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  --time-font="RobotoMono Nerd Font" \
  --date-font="RobotoMono Nerd Font" \
  --layout-font="RobotoMono Nerd Font" \
  --verif-font="RobotoMono Nerd Font" \
  --wrong-font="RobotoMono Nerd Font" \

# These last five lines are commented because they concern the font you want to use.
# JetBrainsMono Nerd Font is the font that was used in the screenshot.
# To specify a favorite font, just uncomment the five lines and replace the parameter with the font you prefer.
