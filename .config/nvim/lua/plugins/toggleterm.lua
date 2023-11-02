return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			size = 999,
			open_mapping = [[<c-t>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local lf = Terminal:new({ cmd = "lfrun", hidden = true, on_exit = Terminal.on_close })
		function _LF_TOGGLE()
			lf:toggle()
		end
	end,
}
