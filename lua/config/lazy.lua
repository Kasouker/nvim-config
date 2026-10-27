local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- lua/plugins_local/ : les plugins de cette machine seulement (ignorés par git, voir .gitignore)
local spec = { { import = "plugins" } }
if (vim.uv or vim.loop).fs_stat(vim.fn.stdpath("config") .. "/lua/plugins_local") then
	table.insert(spec, { import = "plugins_local" })
end

require("lazy").setup({
	spec = spec,
})
