return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
    },

    version = "*",

    opts = {
        keymap = { preset = "default" },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        snippets = { preset = "luasnip" },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
}
