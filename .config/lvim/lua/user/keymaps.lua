 -- Neovim
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-k>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-q>"] = ":BufferKill<cr>"

 -- LSP
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.keys.normal_mode['K'] = "<Cmd>echo NOOO!<CR>"

-- Whichkey
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Lf<CR>", "Lf" }
lvim.builtin.which_key.mappings["z"] = { "za", "Toggle Fold" }
lvim.builtin.which_key.mappings["l"] = { "za", "Toggle Fold" }

-- lvim.builtin.which_key.mappings = {
--   ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
--   ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
--   ["h"] = { '<cmd>let @/=""<CR>', "No Highlight" },

--   p = {
--     name = "Packer",
--     c = { "<cmd>PackerCompile<cr>", "Compile" },
--     i = { "<cmd>PackerInstall<cr>", "Install" },
--     r = { "<cmd>LvimReload<cr>", "Reload" },
--     s = { "<cmd>PackerSync<cr>", "Sync" },
--     u = { "<cmd>PackerUpdate<cr>", "Update" },
--   },
-- }
