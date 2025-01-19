return {
    {
        "echasnovski/mini.statusline",
        dependencies = {
            -- { "echasnovski/mini.icons", opts = {} },
            { "echasnovski/mini-git", main = "mini.git", opts = {} },
            {
                "echasnovski/mini.diff",
                opts = {
                    view = {
                        style = "sign",
                        signs = {
                            add = "+",
                            change = "~",
                            delete = "_",
                        },
                    },
                },
            },
        },
        opts = {},
    },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        version = false,
        opts = {},
    },
}
