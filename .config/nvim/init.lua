require("core.options")
require("core.keymaps")
require("core.autocommands")
require("core.lazy_bootstrap")

require("lazy").setup("plugins")

vim.cmd.colorscheme("melange")
