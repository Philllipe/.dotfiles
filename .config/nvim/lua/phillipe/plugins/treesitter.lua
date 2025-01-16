return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = false,
            	additional_vim_regex_highlighting = { "markdown" }
            },
            ensure_installed = {
		        -- core
                "vim",
                "vimdoc",
		        "query",
                "bash",
                "lua",
		        "markdown",
		        "markdown_inline",

		        -- others
                "c",
                "javascript",
                "typescript",
            },
        })
    end
}
