return {
    "gbprod/yanky.nvim",
    opts = {
        ring = { storage = "memory" },
        highlight = { timer = 100 },
    },
    keys = {
        { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    },
}
