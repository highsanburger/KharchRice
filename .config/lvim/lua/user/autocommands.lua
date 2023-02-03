vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*sxhkdrc" },
      command = "!pkill -USR1 -x sxhkd",
})
