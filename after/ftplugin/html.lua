-- En HTML : « < » donne « <> » (le curseur au milieu) ; un deuxième « < » sur la même ligne donne « </> »
-- (le curseur entre / et >) pour fermer la balise. Taper « > » saute par-dessus celui déjà là.

vim.keymap.set("i", "<", function()
	local before = vim.fn.getline("."):sub(1, vim.fn.col(".") - 1)
	if before:find("<", 1, true) then
		return "<lt>/><Left>"
	end
	return "<lt>><Left>"
end, { buffer = true, expr = true })

vim.keymap.set("i", ">", function()
	local after = vim.fn.getline("."):sub(vim.fn.col("."), vim.fn.col("."))
	if after == ">" then
		return "<Right>"
	end
	return ">"
end, { buffer = true, expr = true })
