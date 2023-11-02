return {
	"lmburns/lf.nvim",
	dependencies = { "toggleterm.nvim" },
	config = function()
		-- This feature will not work if the plugin is lazy-loaded
		vim.g.lf_netrw = 1

		require("lf").setup({
			escape_quit = false,
			border = "rounded",
		})
	end,
}
