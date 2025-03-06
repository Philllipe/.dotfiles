---@diagnostic disable: missing-fields
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local util = require("tokyonight.util")
        require("tokyonight").setup({
            -- Sometimes use transparent windows
            -- transparent = true,
            -- styles = { sidebars = "transparent" },
            on_colors = function(colors)
                -- Sets the indent scope color in snacks.lua
                vim.api.nvim_set_hl(0, "IndentScopeColor", { fg = util.brighten(colors.fg_gutter, 0.2) })
            end,
        })
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
