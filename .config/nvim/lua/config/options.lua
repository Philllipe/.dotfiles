local o = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- line numbers
o.number = true
o.relativenumber = true
o.cursorline = true

-- tabs & indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- splits
o.splitright = true
o.splitbelow = true

-- editor
o.termguicolors = true
o.wrap = false
o.scrolloff = 10
o.signcolumn = "yes"
o.showmode = false
o.fillchars = { eob = " " }

-- other
o.undofile = true
o.swapfile = false
o.updatetime = 50
o.inccommand = "nosplit"
