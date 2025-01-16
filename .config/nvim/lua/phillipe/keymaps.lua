local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        -- Define mappings specfic for LSP related items
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[S]earch [D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        map(']d', vim.diagnostic.goto_next, 'Goto Next [D]iagnostic')
        map('[d', vim.diagnostic.goto_next, 'Goto Previous [D]iagnostic')
    end
})
