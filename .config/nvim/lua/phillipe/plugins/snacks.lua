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
    keys = {
        {
            "<leader>nh",
            function()
                ---@diagnostic disable-next-line
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },
        {
            "<leader>nd",
            function()
                ---@diagnostic disable-next-line
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
        {
            "<leader>lg",
            function()
                ---@diagnostic disable-next-line
                Snacks.lazygit()
            end,
            desc = "Open Lazygit",
        },
    },
}
