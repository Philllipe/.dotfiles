-- This file is used for plugins with minimal configuration
return {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "christoomey/vim-tmux-navigator" },
    { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },
    { "folke/which-key.nvim", event = "VimEnter", opts = { delay = 500 } },
    { "sindrets/diffview.nvim", event = "VeryLazy", opts = {} },
    { "github/copilot.vim", cmd = "Copilot", event = "InsertEnter" },
    { "tpope/vim-surround", event = "InsertEnter", init = function() vim.g.surround_no_mappings = true end },
}
