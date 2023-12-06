return {
	"ptzz/lf.vim",
	"voldikss/vim-floaterm",
	"NvChad/nvim-colorizer.lua",
	"farmergreg/vim-lastplace",
	"kshenoy/vim-signature",
	"lervag/vimtex",
	"chrisbra/csv.vim",
	-- "SirVer/ultisnips",
	-- "honza/vim-snippets",

	-- Git related plugins
	"turbio/bracey.vim",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		"ianding1/leetcode.vim",
		config = function()
			vim.g.leetcode_browser = "chrome" -- or 'firefox'
		end,
	},

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	{
		"terrortylor/nvim-comment",
		dependencies = "numToStr/Comment.nvim",
		config = function()
			require("nvim_comment").setup()
		end,
	},
}
