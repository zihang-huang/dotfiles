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
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Dracula",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { "workspace" },
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "parent", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = {},
		tabline_y = {},
		tabline_z = { "domain" },
	},
	extensions = {},
})

tabline.apply_to_config(config)

config.window_background_opacity = 0.8
config.macos_window_background_blur = 0

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
