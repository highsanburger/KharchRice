return {
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",

	config = function()
		require("nvim-tree").setup({
			on_attach = on_attach,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "󰌵",
					info = "",
					warning = "️️",
					error = "",
				},
			},
			view = {
				width = 30,
				side = "left",
			},
		})
	end,
}
