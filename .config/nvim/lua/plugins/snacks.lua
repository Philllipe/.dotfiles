return {
    "folke/snacks.nvim",
    dependencies = { "folke/tokyonight.nvim" },
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        -- SnacksIndentScope is set in colorscheme.lua
        indent = { scope = { hl = "IndentScopeColor" } },
        notifier = {},
        bigfile = {},
        quickfile = {},
        lazygit = {},
        scroll = {},
        words = {},
    },
}
