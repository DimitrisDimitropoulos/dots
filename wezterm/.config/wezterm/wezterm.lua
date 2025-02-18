local wezterm = require("wezterm")

local leader = "CTRL|SHIFT"

return {
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE",
	enable_scroll_bar = false,
	check_for_updates = false,
	warn_about_missing_glyphs = false,
	font_size = 19.0,
	font = wezterm.font_with_fallback({
		"Comic Code",
	}),
	default_prog = { "/bin/fish" },
	hide_tab_bar_if_only_one_tab = true,
	audible_bell = "Disabled",
	tab_max_width = 40,
	scrollback_lines = 2000,
	default_gui_startup_args = { "connect", "unix" },
	force_reverse_video_cursor = true,
	hide_mouse_cursor_when_typing = false,
	colors = {
		foreground = "#ffffff",
		background = "#121111",
		cursor_bg = "#ffffff",
		cursor_fg = "#ffffff",
		cursor_border = "#ffffff",
		selection_fg = "#ffffff",
		selection_bg = "#2d4f67",
		split = "#36363d",

		ansi = {
			"#21222c",
			"#ff5555",
			"#50fa7b",
			"#f1fa8c",
			"#bd93f9",
			"#ff79c6",
			"#8be9fd",
			"#f8f8f2",
		},
		brights = {
			"#6272a4",
			"#ff6e6e",
			"#69ff94",
			"#ffffa5",
			"#d6acff",
			"#ff92df",
			"#a4ffff",
			"#ffffff",
		},

		indexed = {
			[16] = "#ffa066",
			[17] = "#ff5d62",
		},
	},

	keys = {
		{ key = "m", mods = leader, action = wezterm.action.Hide },
		{ key = "f", mods = leader, action = wezterm.action.ToggleFullScreen },
		{ key = "t", mods = leader, action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "g", mods = leader, action = wezterm.action.CloseCurrentTab({ confirm = false }) },
		{ key = "w", mods = leader, action = wezterm.action.DisableDefaultAssignment },
		{ key = "LeftArrow", mods = leader, action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "RightArrow", mods = leader, action = wezterm.action.ActivateTabRelative(1) },
		{ key = "w", mods = leader, action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{
			key = "Enter",
			mods = leader,
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{ key = "|", mods = leader, action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = leader, action = wezterm.action.PaneSelect },
		{ key = "f", mods = leader, action = wezterm.action.TogglePaneZoomState },
		{ key = "{", mods = leader, action = wezterm.action({ ActivatePaneDirection = "Next" }) },
		{ key = "}", mods = leader, action = wezterm.action({ ActivatePaneDirection = "Prev" }) },
	},
}
