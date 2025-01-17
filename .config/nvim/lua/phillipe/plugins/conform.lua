return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = { "n", "v" },
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        format_on_save = { timeout_ms = 500 },
        default_format_opts = { lsp_format = "fallback" },
        formatters_by_ft = {
            lua = { "stylua --indent-type Spaces" },
        },
    },
}
