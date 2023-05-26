return({
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",
  "Mofiqul/dracula.nvim",
  "luisiacc/gruvbox-baby",
  "morhetz/gruvbox",
  {"Mofiqul/vscode.nvim",
    config = function ()
local colorscheme = "gruvbox-baby"  -- set colorscheme here

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
  end}
})

