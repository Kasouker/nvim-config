return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
    config = function()
		local c = {
			gold = "#C9AB6B", sage = "#A3B592", mauve = "#B79BBC",
			crimson = "#C46B76", amber = "#D0966A",
			dark = "#17191F", bar = "#2B2E36", base = "#1F2229",
			ivory = "#D8D3C6", dim = "#8B8E99",
		}
		local function mode(bg)
			return {
				a = { fg = c.dark, bg = bg, gui = "bold" },
				b = { fg = c.ivory, bg = c.bar },
				c = { fg = c.dim, bg = c.base },
			}
		end
		local theme = {
			normal = mode(c.gold),
			insert = mode(c.sage),
			visual = mode(c.mauve),
			replace = mode(c.crimson),
			command = mode(c.amber),
			inactive = {
				a = { fg = c.dim, bg = c.base },
				b = { fg = c.dim, bg = c.base },
				c = { fg = c.dim, bg = c.base },
			},
		}
		require("lualine").setup({
			options = {
                theme = theme,
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard" } },
            },
		})
	end,
}
