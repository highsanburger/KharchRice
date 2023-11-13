local o = vim.opt

o.timeoutlen = 50 -- WhichKey popup time
o.number = true -- Make line numbers default
o.backup = false -- creates a backup file
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 3 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file o.hlsearch = false                         -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0 -- always show tabs
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- o.term gui colors (most terminals support this)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.tabstop = 8 -- insert 8 spaces for a tab
o.cursorline = true -- highlight the current line
o.number = true -- o.numbered lines
o.relativenumber = true -- o.relatively numbered lines
o.laststatus = 3 -- only the last window will always have a status line
o.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
o.ruler = false -- hide the line and column number of the cursor position
o.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = true -- DONT display lines as one long line
o.scrolloff = 3 -- minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
o.guifont = "monospace:h17" -- the font used in graphical neovim applications
o.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
o.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
o.iskeyword:append("-") -- treats words with `-` as single words
o.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
o.linebreak = true
