require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Resize windows using Ctrl + Alt + hjkl
vim.keymap.set("n", "<C-M-j>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-M-k>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-M-h>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-M-l>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
