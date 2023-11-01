-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Shorten function name
local map = vim.keymap.set
-- Silent map option
local opts = { silent = true }
--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.maplocalleader = ";"
vim.g.mapleader = " "
-- λ
map("i", "<C-l>", "<C-v>u03BB", opts)
map("i", "<C-a>", "<C-v>u2192", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>f", "<cmd>Lf<CR>", opts)

-- Save & Quit
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("n", "<C-x>", ":BufferClose<CR>", opts)

function Close()
  if vim.bo.modified then
    vim.cmd(':wq')
  else
    vim.cmd(':q')
  end
end

-- Map Ctrl + Q to the SaveAndQuit function
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>lua Close()<CR>', { noremap = true, silent = true })


-- Leader
map("n", "<leader>;", "<cmd>Alpha<CR>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Noice Notifs
map("n", "<leader>j", ":NoiceDismiss<CR>", opts)


-- Movin Lines
map("n", "<A-j>", ":m+<CR>==", opts)
map("n", "<A-k>", ":m-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("i", "<A-j>", "<Esc>:m+<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m-2<CR>==gi", opts)

-- tabs
-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-q>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
-- Magic buffer-picking mode
map('n', '<A-f>', '<Cmd>BufferPick<CR>', opts)

-- Vimtex
-- map('n','<leader>ll','<Cmd>VimtexCompile<CR>',opts)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Compile
map('n', '<leader>ll', '<Cmd>VimtexCompile<CR>', opts)

-- View
map('n', '<leader>lv', '<Cmd>VimtexView<CR>', opts)

map('n', '<leader>le', '<Cmd>VimtexErrors<CR>', opts)

-- Open Table of Contents
map('n', '<leader>lt', '<Cmd>VimtexTocToggle<CR>', opts)

-- Jump to Next Section or Environment Start
map('n', ']m', ']]', opts)

-- Jump to Previous Section or Environment Start
map('n', '[m', '[[', opts)

-- Rename Label and Update References
map('n', '<leader>lr', '<Cmd>VimtexLabelRename<CR>', opts)

-- Manage Citations
map('n', '<leader>lc', '<Cmd>VimtexCite<CR>', opts)

-- Add an Environment
map('n', '<leader>la', '<Cmd>VimtexEnv<CR>', opts)

-- Build the Document
map('n', '<leader>lb', '<Cmd>VimtexBuild<CR>', opts)

-- Clean Auxiliary Files
map('n', '<leader>lx', '<Cmd>VimtexClean<CR>', opts)

-- WEB DEV

map('n', '<leader>bb', '<Cmd>Bracey<CR>', opts)
map('n', '<leader>bs', '<Cmd>BraceyStop<CR>', opts)
map('n', '<leader>br', '<Cmd>BraceyReload<CR>', opts)

map('n', '<leader>sn', '<Cmd>lua require("luasnip.loaders").edit_snippet_files()<CR>', opts)

map('n', '<leader>bp', '<Cmd>PickColor<CR>', opts)
map('n', '<leader>bp', '<Cmd>PickColorInsert<CR>', opts)
map('n', '<leader>bc', '<Cmd>ColorizerToggle<CR>', opts)
-- -- Telescope

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>tr', '<Cmd>Telescope oldfiles theme=ivy<CR>', opts)
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope buffers  theme=ivy<CR>', opts)
vim.keymap.set('n', '<leader>tk', '<Cmd>Telescope keymaps  theme=ivy<CR>', opts)
vim.keymap.set('n', '<leader>tf', '<Cmd>Telescope find_files theme=ivy<CR>', opts)
vim.keymap.set('n', '<leader>tg', '<Cmd>Telescope live_grep theme=ivy<CR>', opts)
vim.keymap.set('n', '<leader>th', '<Cmd>Telescope help_tags theme=ivy<CR>', opts)        -- Plugins --
vim.keymap.set('n', '<leader>tt', '<Cmd>Telescope builtin theme=dropdown<CR>', opts)     -- Plugins --
vim.keymap.set('n', '<leader>tc', '<Cmd>Telescope colorscheme theme=dropdown<CR>', opts) -- Plugins --

-- Neorg
vim.keymap.set('n', '<leader>nt', '<Cmd>Neorg toc<CR>', opts)                 -- Plugins --
vim.keymap.set('n', '<leader>nm', '<Cmd>Neorg inject-metadata<CR>', opts)     -- Plugins --
vim.keymap.set('n', '<leader>nx', '<Cmd>Neorg toggle-concealer<CR>', opts)    -- Plugins --

vim.keymap.set('n', '<leader>njj', '<Cmd>Neorg journal today<CR>', opts)      -- Plugins --
vim.keymap.set('n', '<leader>njy', '<Cmd>Neorg journal yesterday<CR>', opts)  -- Plugins --
vim.keymap.set('n', '<leader>njt', '<Cmd>Neorg journal tomorrow<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>njp', '<Cmd>Neorg journal template<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>njp', '<Cmd>Neorg journal template<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>njc', '<Cmd>Neorg journal toc open<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>nju', '<Cmd>Neorg journal toc update<CR>', opts) -- Plugins --

-- local function create_obsidian_note()
--     local title = vim.fn.input("Enter the title of the new note: ")
--     if title ~= "" then
--         vim.cmd(string.format("ObsidianNew %s", title))
--     else
--         print("Note creation canceled.")
--     end
-- end

-- Shorten function name
-- local map = vim.keymap.set
-- -- Silent map option
-- local opts = { silent = true }
-- map('n', '<leader>on', '<Cmd>lua create_obsidian_note()<CR>', opts)

-- Obsidian
vim.keymap.set('n', '<leader>oo', '<Cmd>ObsidianOpen<CR>', opts)        -- Plugins --
vim.keymap.set('n', '<leader>on', '<Cmd>ObsidianNew<CR>', opts)         -- Plugins --
vim.keymap.set('n', '<leader>oq', '<Cmd>ObsidianQuickSwitch<CR>', opts) -- Plugins --
vim.keymap.set('n', '<leader>of', '<Cmd>ObsidianFollowLink<CR>', opts)  -- Plugins --
vim.keymap.set('n', '<leader>ob', '<Cmd>ObsidianBacklinks<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>ot', '<Cmd>ObsidianToday<CR>', opts)       -- Plugins --
vim.keymap.set('n', '<leader>oy', '<Cmd>ObsidianYesterday<CR>', opts)   -- Plugins --
vim.keymap.set('n', '<leader>om', '<Cmd>ObsidianTemplate<CR>', opts)    -- Plugins --
vim.keymap.set('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', opts)      -- Plugins --
vim.keymap.set('v', '<leader>ol', '<Cmd>ObsidianLink<CR>', opts)        -- Plugins --
vim.keymap.set('n', '<leader>ok', '<Cmd>ObsidianLinkNew<CR>', opts)     -- Plugins --

-- -- Comment
map("n", "<C-c>", ":CommentToggle<CR>", opts)
map("v", "<C-c>", ":CommentToggle<CR>", opts)
map("n", "<C-c>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("x", "<C-c>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
--
--
-- -- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
--
-- -- Lsp
--
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>F', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- -- In this case, we create a function that lets us more easily define mappings specific
-- -- for LSP related items. It sets the mode, buffer and description for us each time.
-- local nmap = function(keys, func, desc)
--   if desc then
--     desc = 'LSP: ' .. desc
--   end
--
--   vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
-- end
--
-- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
-- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
-- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
-- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
-- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
-- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
-- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
-- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
-- -- See `:help K` for why this keymap
-- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
-- -- Lesser used LSP functionality
-- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
-- nmap('<leader>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, '[W]orkspace [L]ist Folders')
--

-- NvimTree

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  map("n", "<C-]>", api.tree.change_root_to_node, opts "CD")
  map("n", "<C-e>", api.node.open.replace_tree_buffer, opts "Open: In Place")
  map("n", "<C-k>", api.node.show_info_popup, opts "Info")
  map("n", "<C-r>", api.fs.rename_sub, opts "Rename: Omit Filename")
  map("n", "<C-t>", api.node.open.tab, opts "Open: New Tab")
  map("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
  map("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
  map("n", "<BS>", api.node.navigate.parent_close, opts "Close Directory")
  map("n", "<CR>", api.node.open.edit, opts "Open")
  map("n", "<Tab>", api.node.open.preview, opts "Open Preview")
  map("n", ">", api.node.navigate.sibling.next, opts "Next Sibling")
  map("n", "<", api.node.navigate.sibling.prev, opts "Previous Sibling")
  map("n", ".", api.node.run.cmd, opts "Run Command")
  map("n", "-", api.tree.change_root_to_parent, opts "Up")
  map("n", "a", api.fs.create, opts "Create")
  map("n", "bmv", api.marks.bulk.move, opts "Move Bookmarked")
  map("n", "B", api.tree.toggle_no_buffer_filter, opts "Toggle No Buffer")
  map("n", "c", api.fs.copy.node, opts "Copy")
  map("n", "C", api.tree.toggle_git_clean_filter, opts "Toggle Git Clean")
  map("n", "[c", api.node.navigate.git.prev, opts "Prev Git")
  map("n", "]c", api.node.navigate.git.next, opts "Next Git")
  map("n", "d", api.fs.remove, opts "Delete")
  map("n", "D", api.fs.trash, opts "Trash")
  map("n", "E", api.tree.expand_all, opts "Expand All")
  map("n", "e", api.fs.rename_basename, opts "Rename: Basename")
  map("n", "]e", api.node.navigate.diagnostics.next, opts "Next Diagnostic")
  map("n", "[e", api.node.navigate.diagnostics.prev, opts "Prev Diagnostic")
  map("n", "F", api.live_filter.clear, opts "Clean Filter")
  map("n", "f", api.live_filter.start, opts "Filter")
  map("n", "g?", api.tree.toggle_help, opts "Help")
  map("n", "gy", api.fs.copy.absolute_path, opts "Copy Absolute Path")
  map("n", "H", api.tree.toggle_hidden_filter, opts "Toggle Dotfiles")
  map("n", "I", api.tree.toggle_gitignore_filter, opts "Toggle Git Ignore")
  map("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
  map("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
  map("n", "m", api.marks.toggle, opts "Toggle Bookmark")
  map("n", "o", api.node.open.edit, opts "Open")
  map("n", "O", api.node.open.no_window_picker, opts "Open: No Window Picker")
  map("n", "p", api.fs.paste, opts "Paste")
  map("n", "P", api.node.navigate.parent, opts "Parent Directory")
  map("n", "q", api.tree.close, opts "Close")
  map("n", "r", api.fs.rename, opts "Rename")
  map("n", "R", api.tree.reload, opts "Refresh")
  map("n", "s", api.node.run.system, opts "Run System")
  map("n", "S", api.tree.search_node, opts "Search")
  map("n", "U", api.tree.toggle_custom_filter, opts "Toggle Hidden")
  map("n", "W", api.tree.collapse_all, opts "Collapse")
  map("n", "x", api.fs.cut, opts "Cut")
  map("n", "y", api.fs.copy.filename, opts "Copy Name")
  map("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
  map("n", "<2-LeftMouse>", api.node.open.edit, opts "Open")
  map("n", "<2-RightMouse>", api.tree.change_root_to_node, opts "CD")
  -- END_DEFAULT_ON_ATTACH

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  map("n", "l", api.node.open.edit, opts "Open")
  map("n", "<CR>", api.node.open.edit, opts "Open")
  map("n", "o", api.node.open.edit, opts "Open")
  map("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  map("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
end
map("n", "<leader>c", "<Cmd>BufferClose<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
