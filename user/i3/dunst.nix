{ ... }:

{
  # home.file.".config/dunst/dunstrc".text = ''
  # [global]
  #   frame_color = "#e5e9f0"
  #   separator_color = "#e5e9f0"
  #
  # [base16_low]
  #     msg_urgency = "low"
  #     background = "#3b4252"
  #     foreground = "#4c566a"
  #
  # [base16_normal]
  #     msg_urgency = "normal"
  #     background = "#434c5e"
  #     foreground = "#e5e9f0"
  #
  # [base16_critical]
  #     msg_urgency = "critical"
  #     background = "#bf616a"
  #     foreground = "#eceff4"
  # '';

  home.file.".config/dunst/dunstrc".text = ''
[global]
    font = RobotoMono 8
    # Allow a small subset of html markup:
    #   <b>bold</b>
    #   <i>italic</i>
    #   <s>strikethrough</s>
    #   <u>underline</u>
    # 
    # For a complete reference see
    # https://developer.gnome.org/pygtk/stable/pango-markup-language.html
    # If markup is not allowed, those tags will be stripped out of the
    # message.
    allow_markup = yes
    
    # The format of the message.  Possible variables are:
    # %a appname
    # %s summary
    # %b body
    # %i iconname (including its path)
    # %I iconname (without its path)
    # %p progress value ([ 0%] to [100%])
    # %n progress value without any extra characters
    # %% Literal %
    # Markup is allowed
    format = "<b>%a</b>\n<i>%s</i>%p %n\n%b"
    
    # Sort messages by urgency.
    sort = yes
    
    # Show how many messages are currently hidden (because of geometry).
    indicate_hidden = yes
    
    # Alignment of message text.
    # Possible values are "left", "center" and "right".
    alignment = left
    
    # The frequency with which text that is longer than the notification
    # window allows bounces back and forth.
    # This option conflicts with "word_wrap".
    # Set to 0 to disable.
    bounce_freq = 3

    
    # Show age of message if message is older than show_age_threshold
    # seconds.
    # Set to -1 to disable.
    show_age_threshold = 60
    
    # Split notifications into multiple lines if they don't fit into
    # geometry.
    word_wrap = yes
    
    # Ignore newlines '\n' in notifications.
    ignore_newline = no
    
    
    # The geometry of the window:
    #   [{width}]x{height}[+/-{x}+/-{y}]
    # The geometry of the message window.
    # The height is measured in number of notifications everything else
    # in pixels.  If the width is omitted but the height is given
    # ("-geometry x2"), the message window expands over the whole screen
    # (dmenu-like).  If width is 0, the window expands to the longest
    # message displayed.  A positive x is measured from the left, a
    # negative from the right side of the screen.  Y is measured from
    # the top and down respectevly.
    # The width can be negative.  In this case the actual width is the
    # screen width minus the width defined in within the geometry option.
    geometry = "600x3-10+60"
    
    # Shrink window if it's smaller than the width.  Will be ignored if
    # width is 0.
    shrink = yes
    
    # The transparency of the window.  Range: [0; 100].
    # This option will only work if a compositing windowmanager is
    # present (e.g. xcompmgr, compiz, etc.).
    transparency = 0
    
    # Don't remove messages, if the user is idle (no mouse or keyboard input)
    # for longer than idle_threshold seconds.
    # Set to 0 to disable.
    # default 120
    idle_threshold = 120 
    
    # Which monitor should the notifications be displayed on.
    monitor = 0
    
    # Display notification on focused monitor.  Possible modes are:
    #   mouse: follow mouse pointer
    #   keyboard: follow window with keyboard focus
    #   none: don't follow anything
    # 
    # "keyboard" needs a windowmanager that exports the
    # _NET_ACTIVE_WINDOW property.
    # This should be the case for almost all modern windowmanagers.
    # 
    # If this option is set to mouse or keyboard, the monitor option
    # will be ignored.
    follow = mouse
    
    # Should a notification popped up from history be sticky or timeout
    # as if it would normally do.
    sticky_history = yes
    
    # Maximum amount of notifications kept in history
    history_length = 20
    
    # Display indicators for URLs (U) and actions (A).
    show_indicators = yes
    
    # The height of a single line.  If the height is smaller than the
    # font height, it will get raised to the font height.
    # This adds empty space above and under the text.
    line_height = 0
    
    # Draw a line of "separator_height" pixel height between two
    # notifications.
    # Set to 0 to disable.
    separator_height = 3
    
    # Padding between text and separator.
    # padding = 8
    padding = 8
    
    # Horizontal padding.
    horizontal_padding = 10
    
    # Define a color for the separator.
    # possible values are:
    #  * auto: dunst tries to find a color fitting to the background;
    #  * foreground: use the same color as the foreground;
    #  * frame: use the same color as the frame;
    #  * anything else will be interpreted as a X color.
    # separator_color = "#44475a"
    separator_color = "#e5e9f0"
    
    # Print a notification on startup.
    # This is mainly for error detection, since dbus (re-)starts dunst
    # automatically after a crash.
    startup_notification = false
    
    # dmenu path.
    # dmenu = rofi -dmenu -theme ~/.config/rofi/rofi-dunst/theme.rasi -p "open"
    
    # Browser for opening urls in context menu.
    browser = firefox

    # Align icons left/right/off
    icon_position = left
    min_icon_size = 100
    max_icon_size = 100
    # Paths to default icons.
    #icon_folders = /usr/share/icons/Adwaita/16x16/status/:/usr/share/icons/Adwaita/16x16/devices/
    icon_folders = /usr/share/icons/Papirus-Dark/24x24/actions:/usr/share/icons/Papirus/24x24/animations:/usr/share/icons/Papirus/24x24/apps:/usr/share/icons/Papirus/24x24/categories:/usr/share/icons/Papirus/24x24/devices:/usr/share/icons/Papirus/24x24/emblems:/usr/share/icons/Papirus/24x24/emotes:/usr/share/icons/Papirus/24x24/mimetypes:/usr/share/icons/Papirus/24x24/panel:/usr/share/icons/Papirus/24x24/places:/usr/share/icons/Papirus/24x24/status
    # Define the corner radius of the notification window
    # in pixel size. If the radius is 0, you have no rounded
    # corners.
    # The radius will be automatically lowered if it exceeds half of the
    # notification height to avoid clipping text and/or icons.
    corner_radius = 10

    progress_bar = true
    progress_bar_height = 10

    # Defines action of mouse event
    # Possible values are:
    # * none: Don't do anything.
    # * do_action: If the notification has exactly one action, or one is marked as default,
    #              invoke it. If there are multiple and no default, open the context menu.
    # * close_current: Close current notification.
    # * close_all: Close all notifications.
    mouse_left_click = close_current
    mouse_middle_click = close_all 
    mouse_right_click = do_action

[frame]
    width = 3
    color = "#44475a"

[shortcuts]

    # Shortcuts are specified as [modifier+][modifier+]...key
    # Available modifiers are "ctrl", "mod1" (the alt-key), "mod2",
    # "mod3" and "mod4" (windows-key).
    # Xev might be helpful to find names for keys.
    
    # Close notification.
    close = mod1+space
    
    # Close all notifications.
    # close_all = ctrl+shift+space
    close_all = ctrl+mod1+space

    # Redisplay last message(s).
    # On the US keyboard layout "grave" is normally above TAB and left
    # of "1".
    history = ctrl+mod1+h
    
    # Context menu.
    context = ctrl+mod1+c

[urgency_low]
    background = "#434c5e"
    foreground = "#e5e9f0"
    frame_color = "#81a1c1"
    highlight = "#a3be8c"
    timeout = 2

[urgency_normal]
    background = "#434c5e"
    foreground = "#e5e9f0"
    frame_color = "#81a1c1"
    highlight = "#a3be8c"
    timeout = 2

[urgency_critical]
    background = "#434c5e"
    foreground = "#bf616a"
    frame_color = "#81a1c1"
    highlight = "#a3be8c"
    timeout = 10
  '';
}
