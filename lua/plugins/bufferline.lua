return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Onglet suivant" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Onglet précédent" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{ filetype = "NvimTree", text = "Explorateur", separator = true },
				},
			},
			highlights = {
				fill = { bg = "#1B1E25" },
				background = { fg = "#8B8E99", bg = "#1F2229" },
				buffer_visible = { fg = "#8B8E99", bg = "#1F2229" },
				buffer_selected = { fg = "#C9AB6B", bg = "#2B2E36", bold = true, italic = false },
				indicator_selected = { fg = "#C9AB6B", bg = "#2B2E36" },
				separator = { fg = "#3A3F4B", bg = "#1F2229" },
				separator_visible = { fg = "#3A3F4B", bg = "#1F2229" },
				separator_selected = { fg = "#3A3F4B", bg = "#2B2E36" },
				close_button_selected = { fg = "#C46B76", bg = "#2B2E36" },
			},
		})
    end,
}
