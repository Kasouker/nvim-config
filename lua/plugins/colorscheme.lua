return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "dark",
			transparent = true,
			code_style = {
				comments = "italic",
				keywords = "italic",
			},
			colors = {
				fg = "#D6D0C2",
				red = "#E0626F",
				orange = "#E39A5F",
				yellow = "#E2BE70",
				green = "#9CC47E",
				cyan = "#5FB3B3",
				blue = "#6FA5D6",
				purple = "#BB88C6",
				grey = "#7A8090",
				light_grey = "#9AA0AE",
			},
			highlights = {
				CursorLineNr = { fg = "$yellow", fmt = "bold" },
			},
		})	
		require("onedark").load()
	end,
}
