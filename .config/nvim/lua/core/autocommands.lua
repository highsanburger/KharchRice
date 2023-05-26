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
