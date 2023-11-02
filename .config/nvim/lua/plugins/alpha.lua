return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[██╗░░██╗██╗░░██╗██╗░░░██╗██╗███╗░░░███╗]],
			[[██║░██╔╝██║░░██║██║░░░██║██║████╗░████║]],
			[[█████═╝░███████║╚██╗░██╔╝██║██╔████╔██║]],
			[[██╔═██╗░██╔══██║░╚████╔╝░██║██║╚██╔╝██║]],
			[[██║░╚██╗██║░░██║░░╚██╔╝░░██║██║░╚═╝░██║]],
			[[╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("n", "➕  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "👀  Recent files", ":Telescope oldfiles theme=ivy<CR>"),
			dashboard.button("f", "🔍  Find file", ":Telescope find_files theme=ivy <CR>"),
			dashboard.button("c", "🔧  Config", ":NvimTreeOpen ~/.config/nvim/lua/plugins/<CR>"),
			dashboard.button("l", "😴  Lazy", ":Lazy<CR>"),
			dashboard.button("m", "🔨  Mason", ":Mason<CR>"),
			dashboard.button("q", "👋  Quit", ":qa<CR>"),
		}

		local function footer()
			return "Ars longa, vita brevis."
		end
		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
