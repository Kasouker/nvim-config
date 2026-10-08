-- Passer de l'explorateur à l'éditeur sans fermer l'explorateur
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Fenêtre de gauche" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Fenêtre de droite" })
