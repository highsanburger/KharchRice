reload("user.options")
reload("user.keymaps")
reload("user.autocommands")
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "dracula"
-- vim.cmd('source ~/.config/lvim/init.vim')


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "lua",
  "python",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Plugins
lvim.plugins = {
    {
      {"folke/trouble.nvim"},
    cmd = "TroubleToggle",
    {"ptzz/lf.vim"},
    {"voldikss/vim-floaterm"},
    {"Mofiqul/vscode.nvim"},
    {"morhetz/gruvbox"},
    {"NvChad/nvim-colorizer.lua"},
    {"farmergreg/vim-lastplace"},
    {"kshenoy/vim-signature"},
    {"luisiacc/gruvbox-baby"},
    {"EdenEast/nightfox.nvim"},
    {"Mofiqul/dracula.nvim"},
    {"lervag/vimtex"},
    {"chrisbra/csv.vim"},
    },
}

-- lvim.transparent_window = true

-- lvim.autocommands = {
--     {
--       "BufWritePost", {
--       pattern = { "*sxhkdrc" },
--       callback = "pkill  -USR1 -x sxhkd"
--       end
--     },
--   }
-- }
