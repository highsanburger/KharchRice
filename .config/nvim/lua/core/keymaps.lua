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

-- Define a function to open a vertical terminal and run ghci
function OpenGhciTerminal()
	local current_file = vim.fn.expand("%:p") -- Get the full path of the current file
	local cmd = "vsplit term://ghci " .. current_file
	vim.cmd(cmd)
end

-- Map the function to Leader + r
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua OpenGhciTerminal()<CR>", { noremap = true, silent = true })

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

-- UI
map("n", "<leader>uc", "<Cmd>Telescope colorscheme theme=dropdown<CR>", opts)
map("n", "<leader>ut", "<Cmd>TransparentToggle<CR>", opts)
map("n", "<leader>uu", "<Cmd>NoiceDismiss<CR>", opts)

-- Lsp

map("n", "<leader>li", "<Cmd>LspInfo<CR>", opts)
map("n", "<leader>lt", "<Cmd>TroubleToggle<CR>", opts)

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
map("n", "<leader>xx", "<Cmd>VimtexCompile<CR>", opts) -- Compile
map("n", "<leader>xv", "<Cmd>VimtexView<CR>", opts) -- View
map("n", "<leader>xt", "<Cmd>VimtexTocToggle<CR>", opts) -- Open Table of Contents
map("n", "<leader>xe", "<Cmd>VimtexErrors<CR>", opts)
map("n", "]m", "]]", opts) -- Jump to Next Section or Environment Start
map("n", "[m", "[[", opts) -- Jump to Previous Section or Environment Start
map("n", "<leader>xr", "<Cmd>VimtexLabelRename<CR>", opts) -- Rename Label and Update References
map("n", "<leader>xc", "<Cmd>VimtexCite<CR>", opts) -- Manage Citations
map("n", "<leader>xa", "<Cmd>VimtexEnv<CR>", opts) -- Add an Environment
map("n", "<leader>xb", "<Cmd>VimtexBuild<CR>", opts) -- Build the Document
map("n", "<leader>xl", "<Cmd>VimtexClean<CR>", opts) -- Clean Auxiliary Files

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

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
