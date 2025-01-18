return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format()
            end,
            mode = { "n", "v" },
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        format_on_save = { timeout_ms = 500 },
        default_format_opts = {
            lsp_format = "fallback",
            timeout_ms = "500",
            asnyc = false,
            quiet = false,
        },
        formatters_by_ft = {
            lua = { "stylua" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
    },
}
