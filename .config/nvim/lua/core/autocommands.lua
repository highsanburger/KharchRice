-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   command = "lua vim.lsp.buf.format()",
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "norg" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*sxhkdrc" },
  command = "!pkill -USR1 -x sxhkd",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*bspwmrc" },
  command = "!bspc wm -r",
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*dunstrc" },
  command = "!killall dunst",
})
