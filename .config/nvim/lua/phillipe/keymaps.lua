-- stylua: ignore start

local set = vim.keymap.set

-- NOTE: leader key is set in options.lua

set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Copy & Paste (Yanky)
set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "[y]ank" })
set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "[p]aste after" })
set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "[P]aste before" })

-- Explorer (Neotree)
set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle [e]xplorer" })

-- Notifications (Snacks)
set("n", "<leader>nh", function() Snacks.notifier.show_history() end, { desc = "[n]otification [h]istory" })
set("n", "<leader>nd", function() Snacks.notifier.hide() end, { desc = "[n]otification [d]ismiss all" })

-- Git (Snacks)
set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "[l]azy [g]it" })

-- Diagnostics (Trouble)
set("n", "<leader>xx", "<cmd>Diagnostics toggle<cr>", { desc = "Diagnostics" })
set("n", "<leader>xX", "<cmd>Diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
set("n", "<leader>xa", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP: Show [a]ll Definitions / References" })
set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Picker (Telescope)
local builtin = require("telescope.builtin")
set("n", "<C-p>", builtin.git_files, { desc = "Git [p]roject Search" })
set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" }) -- Stop It, Get Some Help
set("n", "<leader>fw", builtin.grep_string, { desc = "[f]ind current [w]ord" })
set("n", "<leader>fg", builtin.live_grep, { desc = "[f]ind by [g]rep" })
set("n", "<leader>fr", builtin.oldfiles, { desc = '[f]ind [r]ecent files' })
set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })

-- LSP Keymaps only for when an LSP is 'attached' to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", builtin.lsp_definitions, "[g]oto [d]efinition")
        map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
        map("gr", builtin.lsp_references, "[g]oto [r]eferences")
        map("gI", builtin.lsp_implementations, "[g]oto [I]mplementation")

        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("<leader>fs", require("telescope.builtin").lsp_document_symbols, "[f]ind document [s]ymbols")
        map("<leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[find] workspace [S]ymbols")

        map("]d", vim.diagnostic.goto_next, "Goto Next [D]iagnostic")
        map("[d", vim.diagnostic.goto_next, "Goto Previous [D]iagnostic")
    end,
})
