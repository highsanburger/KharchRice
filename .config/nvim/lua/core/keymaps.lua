vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set -- Shorten function name
local opts = { silent = true } -- Silent map option

-- [[ Basic Keymaps ]]

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-S-k>", ":resize -1<CR>", opts)
map("n", "<C-S-j>", ":resize +1<CR>", opts)
map("n", "<C-S-h>", ":vertical resize -1<CR>", opts)
map("n", "<C-S-l>", ":vertical resize +1<CR>", opts)

-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>f", "<cmd>Lf<CR>", opts)

-- Save & Quit
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("n", "<C-x>", ":BufferClose<CR>", opts)

function Close()
	if vim.bo.modified then
		vim.cmd(":wq")
	else
		vim.cmd(":q")
	end
end

-- Map Ctrl + Q to the SaveAndQuit function
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>lua Close()<CR>", { noremap = true, silent = true })

-- Leader
map("n", "<leader>;", "<cmd>Alpha<CR>", opts)

-- -- Comment
map("n", "<C-c>", ":CommentToggle<CR>", opts)
map("v", "<C-c>", ":CommentToggle<CR>", opts)
map("n", "<C-c>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("x", "<C-c>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Movin Lines
map("n", "<A-j>", ":m+<CR>==", opts)
map("n", "<A-k>", ":m-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("i", "<A-j>", "<Esc>:m+<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m-2<CR>==gi", opts)

-- tabs
-- Move to previous/next
map("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<A-q>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)
-- Magic buffer-picking mode
map("n", "<A-f>", "<Cmd>BufferPick<CR>", opts)

-- Misc
map("i", "<C-l>", "<C-v>u03BB", opts) -- λ
map("n", "<leader>sn", '<Cmd>lua require("luasnip.loaders").edit_snippet_files()<CR>', opts)

-- WEB DEV

map("n", "<leader>bb", "<Cmd>Bracey<CR>", opts)
map("n", "<leader>bs", "<Cmd>BraceyStop<CR>", opts)
map("n", "<leader>br", "<Cmd>BraceyReload<CR>", opts)

map("n", "<leader>bp", "<Cmd>PickColor<CR>", opts)
map("n", "<leader>bp", "<Cmd>PickColorInsert<CR>", opts)
map("n", "<leader>bc", "<Cmd>ColorizerToggle<CR>", opts)

-- Telescope
function Close()
	if vim.bo.modified then
		vim.cmd(":wq")
	else
		vim.cmd(":q")
	end
end

-- Map Ctrl + Q to the SaveAndQuit function
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>lua Close()<CR>", { noremap = true, silent = true })

-- Telescope

vim.api.nvim_set_keymap(
	"n",
	"<C-f>",
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 0, previewer = true, }))<CR>",
	{ noremap = true, silent = true }
)

map("n", "<leader>tr", "<Cmd>Telescope oldfiles theme=ivy<CR>", opts)
map("n", "<leader><leader>", "<Cmd>Telescope buffers  theme=ivy<CR>", opts)
map("n", "<leader>tk", "<Cmd>Telescope keymaps  theme=ivy<CR>", opts)
map("n", "<leader>tf", "<Cmd>Telescope find_files theme=ivy<CR>", opts)
map("n", "<leader>tg", "<Cmd>Telescope live_grep theme=ivy<CR>", opts)
map("n", "<leader>th", "<Cmd>Telescope help_tags theme=ivy<CR>", opts) -- Plugins --
map("n", "<leader>tt", "<Cmd>Telescope builtin theme=dropdown<CR>", opts) -- Plugins --
map("n", "<leader>tc", "<Cmd>Telescope colorscheme theme=dropdown<CR>", opts) -- Plugins --

-- Lsp

map("n", "<leader>li", "<Cmd>LspInfo<CR>", opts)

opts.desc = "Smart rename"
map("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
map("n", "<leader>ll", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Restart LSP"
map("n", "<leader>ls", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

opts.desc = "Show documentation for what is under cursor"
map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "See available code actions"
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

opts.desc = "Show documentation for what is under cursor"
map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "Show LSP references"
map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

opts.desc = "Go to declaration"
map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = "Show LSP definitions"
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

opts.desc = "Show LSP implementations"
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

opts.desc = "Show LSP type definitions"
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

opts.desc = "Go to previous diagnostic"
map("n", "gn", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
map("n", "gN", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

-- Vimtex
-- map('n','<leader>ll','<Cmd>VimtexCompile<CR>',opts)
-- local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }
--
-- -- Compile
-- map('n', '<leader>ll', '<Cmd>VimtexCompile<CR>', opts)
--
-- -- View
-- map('n', '<leader>lv', '<Cmd>VimtexView<CR>', opts)
--
-- map('n', '<leader>le', '<Cmd>VimtexErrors<CR>', opts)
--
-- -- Open Table of Contents
-- map('n', '<leader>lt', '<Cmd>VimtexTocToggle<CR>', opts)
--
-- -- Jump to Next Section or Environment Start
-- map('n', ']m', ']]', opts)
--
-- -- Jump to Previous Section or Environment Start
-- map('n', '[m', '[[', opts)
--
-- -- Rename Label and Update References
-- map('n', '<leader>lr', '<Cmd>VimtexLabelRename<CR>', opts)
--
-- -- Manage Citations
-- map('n', '<leader>lc', '<Cmd>VimtexCite<CR>', opts)
--
-- -- Add an Environment
-- map('n', '<leader>la', '<Cmd>VimtexEnv<CR>', opts)
--
-- -- Build the Document
-- map('n', '<leader>lb', '<Cmd>VimtexBuild<CR>', opts)
--
-- -- Clean Auxiliary Files
-- map('n', '<leader>lx', '<Cmd>VimtexClean<CR>', opts)
-- -- Neorg
-- map("n", "<leader>nt", "<Cmd>Neorg toc<CR>", opts) -- Plugins --
-- map("n", "<leader>nm", "<Cmd>Neorg inject-metadata<CR>", opts) -- Plugins --
-- map("n", "<leader>nx", "<Cmd>Neorg toggle-concealer<CR>", opts) -- Plugins --
--
-- map("n", "<leader>njj", "<Cmd>Neorg journal today<CR>", opts) -- Plugins --
-- map("n", "<leader>njy", "<Cmd>Neorg journal yesterday<CR>", opts) -- Plugins --
-- map("n", "<leader>njt", "<Cmd>Neorg journal tomorrow<CR>", opts) -- Plugins --
-- map("n", "<leader>njp", "<Cmd>Neorg journal template<CR>", opts) -- Plugins --
-- map("n", "<leader>njp", "<Cmd>Neorg journal template<CR>", opts) -- Plugins --
-- map("n", "<leader>njc", "<Cmd>Neorg journal toc open<CR>", opts) -- Plugins --
-- map("n", "<leader>nju", "<Cmd>Neorg journal toc update<CR>", opts) -- Plugins --

-- -- Obsidian

-- local function create_obsidian_note()
--     local title = vim.fn.input("Enter the title of the new note: ")
--     if title ~= "" then
--         vim.cmd(string.format("ObsidianNew %s", title))
--     else
--         print("Note creation canceled.")
--     end
-- end

-- map('n', '<leader>on', '<Cmd>lua create_obsidian_note()<CR>', opts)

-- map("n", "<leader>oo", "<Cmd>ObsidianOpen<CR>", opts) -- Plugins --
-- map("n", "<leader>on", "<Cmd>ObsidianNew<CR>", opts) -- Plugins --
-- map("n", "<leader>oq", "<Cmd>ObsidianQuickSwitch<CR>", opts) -- Plugins --
-- map("n", "<leader>of", "<Cmd>ObsidianFollowLink<CR>", opts) -- Plugins --
-- map("n", "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", opts) -- Plugins --
-- map("n", "<leader>ot", "<Cmd>ObsidianToday<CR>", opts) -- Plugins --
-- map("n", "<leader>oy", "<Cmd>ObsidianYesterday<CR>", opts) -- Plugins --
-- map("n", "<leader>om", "<Cmd>ObsidianTemplate<CR>", opts) -- Plugins --
-- map("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", opts) -- Plugins --
-- map("v", "<leader>ol", "<Cmd>ObsidianLink<CR>", opts) -- Plugins --
-- map("n", "<leader>ok", "<Cmd>ObsidianLinkNew<CR>", opts) -- Plugins --

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

-- NvimTree

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--
	-- BEGIN_DEFAULT_ON_ATTACH
	map("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	map("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	map("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	map("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	map("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	map("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	map("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	map("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	map("n", "<CR>", api.node.open.edit, opts("Open"))
	map("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	map("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	map("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	map("n", ".", api.node.run.cmd, opts("Run Command"))
	map("n", "-", api.tree.change_root_to_parent, opts("Up"))
	map("n", "a", api.fs.create, opts("Create"))
	map("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	map("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
	map("n", "c", api.fs.copy.node, opts("Copy"))
	map("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
	map("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	map("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	map("n", "d", api.fs.remove, opts("Delete"))
	map("n", "D", api.fs.trash, opts("Trash"))
	map("n", "E", api.tree.expand_all, opts("Expand All"))
	map("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	map("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	map("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	map("n", "F", api.live_filter.clear, opts("Clean Filter"))
	map("n", "f", api.live_filter.start, opts("Filter"))
	map("n", "g?", api.tree.toggle_help, opts("Help"))
	map("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	map("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	map("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	map("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	map("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	map("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	map("n", "o", api.node.open.edit, opts("Open"))
	map("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
	map("n", "p", api.fs.paste, opts("Paste"))
	map("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	map("n", "q", api.tree.close, opts("Close"))
	map("n", "r", api.fs.rename, opts("Rename"))
	map("n", "R", api.tree.reload, opts("Refresh"))
	map("n", "s", api.node.run.system, opts("Run System"))
	map("n", "S", api.tree.search_node, opts("Search"))
	map("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
	map("n", "W", api.tree.collapse_all, opts("Collapse"))
	map("n", "x", api.fs.cut, opts("Cut"))
	map("n", "y", api.fs.copy.filename, opts("Copy Name"))
	map("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	map("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	map("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	map("n", "l", api.node.open.edit, opts("Open"))
	map("n", "<CR>", api.node.open.edit, opts("Open"))
	map("n", "o", api.node.open.edit, opts("Open"))
	map("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	map("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end
map("n", "<leader>c", "<Cmd>BufferClose<CR>", opts)
