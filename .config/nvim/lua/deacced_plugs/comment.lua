return {
	"terrortylor/nvim-comment",
	dependencies = "numToStr/Comment.nvim",
	config = function()
		require("nvim_comment").setup()
	end,
}
