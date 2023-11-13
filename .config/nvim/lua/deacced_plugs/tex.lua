return {
	"lervag/vimtex",
	event = false,
	dependencies = {
		"kdheepak/cmp-latex-symbols",
		"jbyuki/nabla.nvim", -- show symbols in editor
	},
	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets/" })
		--     vim.g.vimtex_view_general_viewer = 'zathura'
		--     vim.g.vimtex_compiler_latexmk_engines = {
		--       _ = '-xelatex'
		--     }
		--
		-- -- Ignore mappings
		-- vim.g['vimtex_mappings_enabled'] = 0
		--
		-- -- Auto Indent
		-- vim.g['vimtex_indent_enabled'] = 1
		--
		-- -- Syntax highlighting
		-- vim.g['vimtex_syntax_enabled'] = 1
		--     vim.g.tex_comment_nospell = 1
		--     vim.g.vimtex_compiler_progname = 'nvr'
		-- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
		-- vim.g.vimtex_view_general_options_latexmk = '--unique'
		-- PDF Viewer:
		-- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
		vim.g["vimtex_view_method"] = "zathura"
		vim.g["vimtex_quickfix_mode"] = 0

		-- Ignore mappings
		vim.g["vimtex_mappings_enabled"] = 1

		-- Auto Indent
		vim.g["vimtex_indent_enabled"] = 1

		-- Syntax highlighting
		vim.g["vimtex_syntax_enabled"] = 1

		-- Error suppression:
		-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

		vim.g["vimtex_log_ignore"] = {
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
		}

		vim.g["vimtex_context_pdf_viewer"] = "okular"

		-- vim.g['vimtex_complete_enabled'] = 1
		-- vim.g['vimtex_compiler_progname'] = 'nvr'
		-- vim.g['vimtex_complete_close_braces'] = 1
	end,
}
