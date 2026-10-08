return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Parsers installés d'office
			ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline" },
			-- Installe automatiquement le parser quand tu ouvres un nouveau type de fichier
			auto_install = true,
			highlight = { enable = true },
		})
	end,
}
