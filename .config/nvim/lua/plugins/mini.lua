return {
    {
        "echasnovski/mini.statusline",
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
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
        version = false,
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.files",
        version = false,
        opts = {},
    },
    {
        "echasnovski/mini.move",
        version = "false",
        opts = {},
    },
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {},
    },
}
