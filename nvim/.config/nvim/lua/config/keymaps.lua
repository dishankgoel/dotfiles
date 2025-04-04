-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- moving blocks of selected text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- copying through clipboard
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- moving through quickfix list
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":cclose<CR>", { noremap = true, silent = true })
