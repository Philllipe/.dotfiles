return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        { "j-hui/fidget.nvim", opts = {} },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    { path = "snacks.nvim", words = { "Snacks" } },
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Example manual setup
        -- lspconfig.lua_ls.setup({ capabilities = capabilities })

        -- Automatic setup with mason
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({ capabilities = capabilities })
            end,
        })

        -- Change diagnostic icons in the sign column (gutter)
        vim.diagnostic.config({
            underline = true,
            signs = false,
            update_in_insert = true,
            severity_sort = true,
            jump = { float = true },
            virtual_text = {
                spacing = 2,
                current_line = true,
                source = "if_many",
                prefix = "",
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end,
}
