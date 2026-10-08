
return {

	"nvim-telescope/telescope.nvim",

	branch = "0.1.x",

	dependencies = {

		"nvim-lua/plenary.nvim",

		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	},

	cmd = "Telescope",

	keys = {

		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Chercher un fichier" },

		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Chercher du texte" },

		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Fichiers ouverts" },

		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Fichiers récents" },

	},

	config = function()

		local telescope = require("telescope")

		telescope.setup({

defaults = {

-- Ignore les dossiers lourds et les fichiers objets du C

file_ignore_patterns = { "node_modules", "%.o$" },

},

})

		-- Tri plus rapide et plus précis (ignoré sans erreur s'il n'est pas compilé)

		pcall(telescope.load_extension, "fzf")

	end,

}

