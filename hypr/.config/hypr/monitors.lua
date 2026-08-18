-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- AOC gaming monitor
hl.monitor({ output = "desc:AOC Q32G1WG4", mode = "2560x1440@143.91", position = "auto", scale = 1 })

-- DP-1 and HDMI-A-1 (highest refresh rate)
hl.monitor({ output = "DP-1", mode = "highrr", position = "auto", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "highrr", position = "auto", scale = 1 })

-- Catch-all for any other monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })
