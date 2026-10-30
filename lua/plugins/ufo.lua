return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = { "BufReadPost", "BufNewFile" },
	init = function()
		-- Flèches cliquables dans la marge, comme dans VS Code
		vim.o.foldcolumn = "1"
		vim.opt.fillchars:append({ fold = " ", foldopen = "▾", foldclose = "▸", foldsep = " " })
		-- Tous les blocs ouverts à l'ouverture d'un fichier
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	keys = {
		{ "zR", function() require("ufo").openAllFolds() end, desc = "Ouvrir tous les blocs" },
		{ "zM", function() require("ufo").closeAllFolds() end, desc = "Fermer tous les blocs" },
	},
	config = function()
		-- Un bloc fermé : sa première ligne, puis « ··· N lignes »
		local function fold_text(virt_text, lnum, end_lnum, width, truncate)
			local result = {}
			local suffix = ("  ··· %d lignes "):format(end_lnum - lnum)
			local target = width - vim.fn.strdisplaywidth(suffix)
			local cur = 0
			for _, chunk in ipairs(virt_text) do
				local text, hl = chunk[1], chunk[2]
				local w = vim.fn.strdisplaywidth(text)
				if cur + w > target then
					table.insert(result, { truncate(text, target - cur), hl })
					break
				end
				table.insert(result, chunk)
				cur = cur + w
			end
			table.insert(result, { suffix, "Comment" })
			return result
		end

		require("ufo").setup({
			-- Les blocs sont trouvés par treesitter, sinon par l'indentation
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
			fold_virt_text_handler = fold_text,
		})
	end,
}
