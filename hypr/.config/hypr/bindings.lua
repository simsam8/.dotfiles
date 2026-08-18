-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Unbind keys before rebinding
hl.unbind("SUPER + T") -- was: Toggle window floating/tiling
hl.unbind("SUPER + J") -- was: Toggle window split
hl.unbind("SUPER + K") -- was: Keybindings
hl.unbind("SUPER + L") -- was: Toggle workspace layout
hl.unbind("SUPER + SHIFT + W") -- was: Omawrite
hl.unbind("SUPER + SPACE") -- was: Omarchy menu
hl.unbind("SUPER ALT + SPACE") -- was: Apps menu
hl.unbind("SUPER ALT + F") -- was: Full width
hl.unbind("SUPER + ESCAPE") -- was: System menu
hl.unbind("SUPER + D") -- no default
hl.unbind("SUPER + B") -- no default
hl.unbind("SUPER SHIFT + D") -- was: Docker
hl.unbind("SUPER SHIFT + F") -- was: File manager
hl.unbind("SUPER SHIFT + P") -- was: Google Photos
hl.unbind("SUPER SHIFT + S") -- was: Google Maps

-- Terminal
o.bind("SUPER + T", "Terminal", "alacritty")

-- Vim navigation
o.bind("SUPER + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Move focus down", hl.dsp.focus({ direction = "d" }))

-- Swap windows
o.bind("SUPER + SHIFT + H", "Swap left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Swap right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Swap up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Swap down", hl.dsp.window.swap({ direction = "d" }))

-- Move workspace to monitor
o.bind("SUPER + SHIFT + ALT + H", "Workspace to left monitor", hl.dsp.workspace.move({ monitor = "l" }))
o.bind("SUPER + SHIFT + ALT + L", "Workspace to right monitor", hl.dsp.workspace.move({ monitor = "r" }))
o.bind("SUPER + SHIFT + ALT + K", "Workspace to upper monitor", hl.dsp.workspace.move({ monitor = "u" }))
o.bind("SUPER + SHIFT + ALT + J", "Workspace to lower monitor", hl.dsp.workspace.move({ monitor = "d" }))

-- Close window
o.bind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())

-- App launcher
o.bind("SUPER + D", "App launcher", "omarchy-menu toggle apps")

-- Omarchy menu
o.bind("SUPER + SHIFT + D", "Omarchy menu", "omarchy-menu")

-- Full width
o.bind("SUPER + SHIFT + F", "Fullscreen width", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Power menu
o.bind("SUPER + SHIFT + P", "Power menu", "omarchy-menu toggle system")

-- Toggle floating
o.bind("SUPER + SHIFT + S", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))

-- Password manager
o.bind("SUPER + SHIFT + R", "Password manager", "bitwarden_rbw.sh")

-- Toggle layout
o.bind("SUPER + R", "Toggle layout", "omarchy-hyprland-workspace-layout-toggle")

-- Show keybindings
o.bind("SUPER + B", "Show keybindings", "omarchy-menu-keybindings")
