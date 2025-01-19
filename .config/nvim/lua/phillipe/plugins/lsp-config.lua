return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        { "j-hui/fidget.nvim", opts = {} },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
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

        -- Change diagnocist icons in the sign column (gutter)
        local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- LSP Keymaps only for when an LSP is 'attached' to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- Define mappings specfic for LSP related items
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[S]earch [D]ocument [S]ymbols")
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                map("]d", vim.diagnostic.goto_next, "Goto Next [D]iagnostic")
                map("[d", vim.diagnostic.goto_next, "Goto Previous [D]iagnostic")
            end,
        })
    end,
}
