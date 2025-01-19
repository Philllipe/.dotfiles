local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
