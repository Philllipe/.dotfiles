return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = true,
        default_format_opts = {
            lsp_format = "fallback",
            timeout_ms = 500,
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
