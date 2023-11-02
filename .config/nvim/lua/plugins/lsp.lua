return {
	"neovim/nvim-lspconfig", -- LSP Configuration & Plugins
	dependencies = {
		{ "williamboman/mason.nvim", config = true }, -- Automatically install LSPs to stdpath for neovim
		"williamboman/mason-lspconfig.nvim",

		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} }, -- Useful status updates for LSP NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

		"folke/neodev.nvim", -- Additional lua configuration, makes nvim stuff amazing!
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- linting & formatting
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				-- "ormolu", -- haskell
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["hls"].setup({
			filetypes = { "haskell", "lhaskell", "cabal" },
			capabilities = capabilities,
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
		})

		lspconfig["jdtls"].setup({
			capabilities = capabilities,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,

			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,

			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
