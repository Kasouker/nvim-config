
return {

	"mbbill/undotree",

	keys = {

		{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Historique d'annulations" },

	},

	init = function()

		vim.g.undotree_SetFocusWhenToggle = 1

	end,

}

