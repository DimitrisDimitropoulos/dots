local wezterm = require("wezterm")

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
	font_size = 16.0,
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
		foreground = "#dcd7ba",
		background = "#121111",
		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
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
		-- window
		{ key = "m", mods = "CTRL|ALT", action = wezterm.action.Hide },
		{ key = "f", mods = "CTRL|ALT", action = wezterm.action.ToggleFullScreen },
		-- tab
		{ key = "t", mods = "CTRL|ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CTRL|ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "j", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "k", mods = "CTRL|ALT", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
		{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
		{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
		{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
		{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
		{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
		{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
		{ key = "0", mods = "ALT", action = wezterm.action.ActivateTab(9) },
		-- pane
		{ key = "w", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "h", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "v", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "ALT", action = wezterm.action.PaneSelect },
		{ key = "f", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	},
}