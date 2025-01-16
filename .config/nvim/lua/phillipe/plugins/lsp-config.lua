return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("fidget").setup({})

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
					},
				},
			},
		}

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		})
	end,
}
