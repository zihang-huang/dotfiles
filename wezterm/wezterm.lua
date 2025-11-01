-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "Dracula (base16)"

-- Font
config.font = wezterm.font_with_fallback({ "Cascadia Code NF", "Noto Sans SC" })
config.font_size = 15

-- Tab Bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	top = 5,
	right = 5,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 1000

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
