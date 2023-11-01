require("core.options")
require("core.keymaps")
require("core.autocommands")
require("core.lazy")

require('lazy').setup({
  { import = 'plugins' },
  { import = 'langs' },
}, {})

vim.cmd.colorscheme 'melange'
