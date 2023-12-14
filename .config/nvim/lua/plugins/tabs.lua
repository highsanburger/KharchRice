return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			-- "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		event = "VeryLazy",

		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		opts = {
			icons = {
				button = "☩",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true },
					[vim.diagnostic.severity.WARN] = { enabled = true },
					[vim.diagnostic.severity.INFO] = { enabled = true },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				-- gitsigns = {
				-- 	added = { enabled = true, icon = "+" },
				-- 	changed = { enabled = true, icon = "~" },
				-- 	deleted = { enabled = true, icon = "-" },
				-- },

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = false },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},
		},
	},
}
