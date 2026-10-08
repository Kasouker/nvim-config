
return {

	"HiPhish/rainbow-delimiters.nvim",

	event = { "BufReadPost", "BufNewFile" },

	init = function()

		-- Une couleur par niveau d'imbrication, dans cet ordre

local palette = {

{ "RainbowGold", "#E2BE70" },

{ "RainbowRose", "#E0626F" },

{ "RainbowSage", "#9CC47E" },

{ "RainbowBlue", "#6FA5D6" },

{ "RainbowMauve", "#BB88C6" },

{ "RainbowAmber", "#E39A5F" },

{ "RainbowTeal", "#5FB3B3" },

}



local function set_colors()

for _, p in ipairs(palette) do

vim.api.nvim_set_hl(0, p[1], { fg = p[2] })

end

end

-- Réappliquées si le thème est rechargé

vim.api.nvim_create_autocmd("ColorScheme", { callback = set_colors })

set_colors()



vim.g.rainbow_delimiters = {

highlight = vim.tbl_map(function(p)

return p[1]

end, palette),

}

end,

}

