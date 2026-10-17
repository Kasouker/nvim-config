return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
			-- ts_ls a besoin de tsserver.js, absent de TypeScript 7 → remplacé par tsc
			automatic_enable = { exclude = { "ts_ls" } },
		})

		-- TypeScript 7 : serveur intégré (tsc --lsp), pris dans node_modules du projet
		vim.lsp.enable("tsc")

		-- Les serveurs envoient leurs suggestions à nvim-cmp
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- lua_ls : ne pas signaler "vim" comme variable inconnue
		vim.lsp.config("lua_ls", {
			settings = { Lua = { diagnostics = { globals = { "vim" } } } },
		})

		-- Raccourcis actifs seulement quand un serveur est attaché au fichier
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local map = function(keys, fn, desc)
					vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
				end
				map("gd", vim.lsp.buf.definition, "Aller à la définition")
				map("K", vim.lsp.buf.hover, "Documentation")
				map("<leader>rn", vim.lsp.buf.rename, "Renommer")
				map("<leader>ca", vim.lsp.buf.code_action, "Actions de code")
				map("<leader>d", vim.diagnostic.open_float, "Voir l'erreur")
			end,
		})
	end,
}
