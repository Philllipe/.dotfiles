local o = vim.opt

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
o.breakindent = true
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

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- other
o.undofile = true
o.swapfile = false
o.updatetime = 200
o.inccommand = "split"
