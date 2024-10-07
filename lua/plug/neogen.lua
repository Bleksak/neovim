require("neogen").setup {
    snippet_engine = "nvim"
}

vim.keymap.set(
    "n",
    "<leader>ng",
    function() require('neogen').generate() end,
    { desc = "Neogen", silent = true, noremap = true }
)

vim.keymap.set(
    "n",
    "<leader>nc",
    function() require('neogen').generate({ type = 'class' }) end,
    { desc = "Neogen class", silent = true, noremap = true }
)

vim.keymap.set(
    "n",
    "<leader>nf",
    function() require('neogen').generate({ type = 'func' }) end,
    { desc = "Neogen func", silent = true, noremap = true }
)

vim.keymap.set(
    "n",
    "<leader>nt",
    function() require('neogen').generate({ type = 'type' }) end,
    { desc = "Neogen type", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>nd",
    function() require('neogen').generate({ type = 'file' }) end,
    { desc = "Neogen file", silent = true, noremap = true }
)
