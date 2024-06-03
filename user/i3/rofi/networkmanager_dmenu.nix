{ pkgs, ... }:

{

  home.file.".config/networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    fn = -*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*
    dmenu_command = rofi -width 30
    rofi_highlight = True
    # # Note that dmenu_command can contain arguments as well like `rofi -width 30`
    # # Rofi and dmenu are set to case insensitive by default `-i`
    # l = number of lines to display, defaults to number of total network options
    # fn = font string
    # nb = normal background (name, #RGB, or #RRGGBB)
    # nf = normal foreground
    # sb = selected background
    # sf = selected foreground
    # b =  (just set to empty value and menu will appear at the bottom
    # m = number of monitor to display on
    # p = Custom Prompt for the networks menu
    # pinentry = Pinentry command
     
    # [editor]
    # terminal = terminator
    # gui_if_available = True
  '';
}
