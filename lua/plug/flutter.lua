require("flutter-tools").setup({})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.dart",
    callback = function()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    end
})
