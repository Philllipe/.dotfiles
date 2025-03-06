return {
    "folke/noice.nvim",
    dependencies = { { "MunifTanjim/nui.nvim" } },
    opts = {
        notify = { enabled = false },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
        },
    },
}
