vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- for conciceness
local keymap = vim.keymap.set

-- window management
keymap("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- window navigation
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- misc
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- diagnostic keymaps
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
