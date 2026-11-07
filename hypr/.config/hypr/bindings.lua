-- Personal keybinding overrides. Omarchy defaults load first (see
-- hyprland.lua), so o.rebind replaces a default and o.bind adds a new key.

-- Terminal (replaces Super+T toggle-floating)
o.rebind("SUPER + T", "Terminal", "alacritty")

-- Vim navigation (replaces J split, K keybindings, L layout)
o.rebind("SUPER + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.rebind("SUPER + J", "Move focus down", hl.dsp.focus({ direction = "d" }))
o.rebind("SUPER + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.rebind("SUPER + L", "Move focus right", hl.dsp.focus({ direction = "r" }))

-- Swap windows
o.rebind("SUPER + SHIFT + H", "Swap left", hl.dsp.window.swap({ direction = "l" }))
o.rebind("SUPER + SHIFT + L", "Swap right", hl.dsp.window.swap({ direction = "r" }))
o.rebind("SUPER + SHIFT + K", "Swap up", hl.dsp.window.swap({ direction = "u" }))
o.rebind("SUPER + SHIFT + J", "Swap down", hl.dsp.window.swap({ direction = "d" }))

-- Move workspace to monitor (per-monitor-aware helper from 4.5)
o.rebind("SUPER + SHIFT + ALT + H", "Workspace to left monitor", o.workspaces.move_to_monitor("l"))
o.rebind("SUPER + SHIFT + ALT + L", "Workspace to right monitor", o.workspaces.move_to_monitor("r"))
o.rebind("SUPER + SHIFT + ALT + K", "Workspace to upper monitor", o.workspaces.move_to_monitor("u"))
o.rebind("SUPER + SHIFT + ALT + J", "Workspace to lower monitor", o.workspaces.move_to_monitor("d"))

-- App launcher and Omarchy menu (frees Docker on Shift+D)
o.rebind("SUPER + D", "App launcher", "omarchy-menu toggle apps")
o.rebind("SUPER + SHIFT + D", "Omarchy menu", { menu = "root" })

-- Full width (frees File manager on Shift+F)
o.rebind("SUPER + SHIFT + F", "Fullscreen width", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Power menu (frees Google Photos on Shift+P)
o.rebind("SUPER + SHIFT + P", "Power menu", { menu = "system" })

o.rebind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())

-- Toggle floating (frees Google Maps on Shift+S)
o.rebind("SUPER + SHIFT + S", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))

-- Cycle workspace layout (Super+L is focus-right; Alt+L is cycle-back)
o.rebind("SUPER + R", "Cycle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Show keybindings
o.rebind("SUPER + B", "Show keybindings", "omarchy-menu-keybindings")

-- Close: use the new defaults Super+Q / Super+W.
-- Calculator: keep the new default Super+Shift+Q.
-- Passwords: keep the new default Super+Shift+Slash (1Password).

-- Deliberately removed defaults
hl.unbind("SUPER + SHIFT + W") -- Omawrite
hl.unbind("SUPER + ESCAPE") -- System menu
hl.unbind("SUPER + ALT + SPACE") -- Apps (moved to Super+D)
hl.unbind("SUPER + ALT + F") -- duplicate full width (Shift+F keeps it)
hl.unbind("SUPER + W") -- Default close window
hl.unbind("SUPER + Q") -- Default close window
