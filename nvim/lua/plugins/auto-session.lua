return {
	'rmagatti/auto-session',
	config = function ()
		require("auto-session").setup {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/"},
			session_lens = {
				buftypes_to_igonore = {}, -- list of buffer types that should not be deleted from current session
			load_on_setup = true,
			theme_conf = { border = true },
			previewer = false,
		},
	}
	vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
		noremap = true,
	})
end
}
