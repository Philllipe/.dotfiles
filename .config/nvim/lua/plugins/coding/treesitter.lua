return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = false,
            indent = { enable = true },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },

                -- disable large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
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
                "go",
                "gomod",
                "javascript",
                "typescript",
                "html",
            },
        })
    end,
}
