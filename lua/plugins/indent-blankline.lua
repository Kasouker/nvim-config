
return {

	"lukas-reineke/indent-blankline.nvim",

	main = "ibl",

	event = { "BufReadPost", "BufNewFile" },

	config = function()

		-- Couleurs : lignes discrètes, bloc courant en or

		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()

			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#4B505C" })

			vim.api.nvim_set_hl(0, "IblScope", { fg = "#C9AB6B" })

		end)



		require("ibl").setup({

indent = { char = "│", tab_char = "│" },

scope = { enabled = true, show_start = false, show_end = false },

})

	end,

}

