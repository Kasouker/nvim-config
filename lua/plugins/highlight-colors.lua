return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>tc", "<cmd>HighlightColors Toggle<CR>", desc = "Afficher / masquer les couleurs" },
	},
	opts = {
		-- Le code de la couleur est surligné avec sa propre couleur
		render = "background",
		-- #fff, #C9AB6B, rgb(), hsl(), var(--x) en CSS…
		enable_hex = true,
		enable_short_hex = true,
		enable_rgb = true,
		enable_hsl = true,
		enable_var_usage = true,
		-- …et les noms : red, blue, orange…
		enable_named_colors = true,
		enable_tailwind = true,
	},
}
