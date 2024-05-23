require("core.options")
require("core.keymaps")
require("core.autocommands")
require("core.lazy_bootstrap")
--
-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("github_light")
-- vim.cmd.colorscheme("moonfly")
if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.15)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.15)
	end)
end
-- vim.opt.number = false
