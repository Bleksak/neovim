require("deletethis").setup()

vim.keymap.set("n", "<leader>xf", "<cmd>DeleteThis<cr>", { desc = "Delete current file" })
