if vim.fn.filereadable("artisan") == 0 then
    return
end

require("laravel-ide-helper").setup({
    models_args = { "-N", "--reset", "-M" },
})

require("laravel").setup({
    lsp_server = "intelephense",
    ui = {
        default = "popup",
        nui_opts = {
            popup = {
                size = {
                    width = "75%",
                    height = "60%",
                },
            },
        },
    },
})

vim.keymap.set("n", "<leader>lgm", function()
    require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
end, { desc = "Generate Model Info for current model" })
vim.keymap.set("n", "<leader>lgM", function()
    require("laravel-ide-helper").generate_models()
end, { desc = "Generate Model Info for all models" })

vim.keymap.set("n", "<leader>la", ":Laravel artisan<cr>", { desc = "Laravel artisan" })
vim.keymap.set("n", "<leader>lr", ":Laravel routes<cr>", { desc = "Laravel routes" })
vim.keymap.set("n", "<leader>lm", ":Laravel related<cr>", { desc = "Laravel related" })
