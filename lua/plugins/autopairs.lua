
return {

	"windwp/nvim-autopairs",

	event = "InsertEnter",

	dependencies = { "hrsh7th/nvim-cmp" },

	config = function()

		require("nvim-autopairs").setup({})

		-- « < » se ferme tout seul en « <> », le curseur au milieu ; taper « > » saute par-dessus celui déjà là
		-- (sauf en HTML : voir after/ftplugin/html.lua)

		local Rule = require("nvim-autopairs.rule")

		local cond = require("nvim-autopairs.conds")

		require("nvim-autopairs").add_rule(Rule("<", ">", "-html"):with_move(cond.move_right()))



		-- Ajoute la parenthèse quand tu valides une fonction dans les suggestions

		local cmp = require("cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	end,

}

