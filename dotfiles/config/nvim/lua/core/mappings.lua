local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
local opts_expr = { noremap = true, silent = true, expr = true }

--Remap space as leader key
-- keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copy/Paste in systemclipboard
keymap("n", "<leader>c", '"+y', opts)
keymap("v", "<leader>c", '"+y', opts)

keymap("n", "<leader>v", '"+p', opts)
keymap("v", "<leader>v", '"+p', opts)
keymap("n", "<leader>V", '"+P', opts)

--Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opts_expr)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opts_expr)

-- keymap(
--   "n",
--   "<PageDown>",
--   "(&buftype is# \"quickfix\" || empty(filter(tabpagebuflist(), 'getbufvar(v:val, \"&buftype\") is# \"quickfix\"'))) ? '<PageDown>' : ':cn<CR>'",
--   opts_expr
-- )
--
-- keymap(
--   "n",
--   "<PageUp>",
--   "(&buftype is# \"quickfix\" || empty(filter(tabpagebuflist(), 'getbufvar(v:val, \"&buftype\") is# \"quickfix\"'))) ? '<PageUp>' : ':cp<CR>'",
--   opts_expr
-- )
--
keymap("n", "[q", ":cn<CR>", opts)

keymap("n", "]q", ":cp<CR>", opts)

keymap("n", "<leader>e", ":e! ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>p", ":Oil ~/.config/nvim/lua/plugins/<CR>", opts)

keymap("n", "<F5>", ":UndotreeToggle<CR>", opts)

-- Keep the cursor in place while joining line
keymap("n", "J", "mzJ`z", opts)

-- Open neovlip
-- keymap("n", '""', "", {
--   noremap = true,
--   silent = true,
--   callback = function()
--     require("telescope").extensions.neoclip.default()
--   end,
-- })

-- Y yank until the end of line  (note: this is now a default on master)
keymap("n", "Y", "y$", opts)

keymap("v", "<C-s>", '"vy:%s/<C-r>v/&/g', opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>ss", ":setlocal spell!<CR>", opts)

-- Navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
