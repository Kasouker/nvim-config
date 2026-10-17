
return {

	"nvimdev/dashboard-nvim",

	event = "VimEnter",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()

		require("dashboard").setup({
            theme = "hyper",
			hide = { statusline = false, tabline = false, winbar = false },
            config = {
                week_header = { enable = true },
                shortcut = {
                    { desc = "Fichiers", group = "Label", action = "Telescope find_files", key = "f" },
                    { desc = "Récents", group = "Label", action = "Telescope oldfiles", key = "r" },
                    { desc = "Config nvim", group = "Label", action = "edit ~/.config/nvim/init.lua", key = "c" },
                    { desc = "Quitter", group = "Label", action = "qa", key = "q" },
                },
            },
        })
	end,
}
