-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "Dracula (base16)"

-- Font
config.font = wezterm.font("Cascadia Code NF")
config.font_size = 13

-- Tab Bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

config.window_background_opacity = 0.8

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	top = 5,
	right = 5,
	bottom = 0,
}

-- Change Deafult Shell
if string.find(wezterm.target_triple, "windows") then
	config.default_prog = { "powershell.exe", "-NoLogo" }
end

-- Keys
config.keys = {
	{ key = "h", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "h", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "l", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "l", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "k", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "k", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({
		"Up",
		1,
	}) },
	{ key = "j", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "j", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
}

-- Finally, return the configuration to wezterm:
return config
