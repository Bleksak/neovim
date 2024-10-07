require("neo-tree").setup({})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle float<cr>", { desc = "Toggle Explorer" })
vim.keymap.set("n", "<leader>E", "<cmd>Neotree toggle float reveal<cr>", { desc = "Toggle Explorer with file reveal" })
