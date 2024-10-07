local loaders = require("luasnip.loaders.from_vscode")
loaders.lazy_load()

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
    end
    if vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
    end
end, {
    desc = "Expand or jump",
})

vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if require("luasnip").locally_jumpable(-1) then
        require("luasnip").jump(-1)
    end
    if vim.snippet.active({ direction = -1 }) then
        vim.snippet.jump(-1)
    end
end, {
    desc = "Jump backward",
})

