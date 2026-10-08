vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"



-- Norme 42 : vraies tabulations dans les fichiers C

vim.api.nvim_create_autocmd("FileType", {

pattern = "c",

callback = function()

		vim.opt_local.expandtab = false

		vim.opt_local.tabstop = 4

		vim.opt_local.shiftwidth = 4

	end,

})

vim.opt.cursorline = true
