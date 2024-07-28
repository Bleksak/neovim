return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },

    opts = {
        snippet_engine = "luasnip"
    },

    keys = {
        {
            "<Leader>ng",
            ":lua require('neogen').generate()<CR>",
            desc = "Neogen",
            silent = true,
            noremap = true,
        },
        {
            "<Leader>nc",
            ":lua require('neogen').generate({ type = 'class' })<CR>",
            desc = "Neogen class",
            silent = true,
            noremap = true,
        },
        {
            "<Leader>nf",
            ":lua require('neogen').generate({ type = 'func' })<CR>",
            desc = "Neogen func",
            silent = true,
            noremap = true,
        },
        {
            "<Leader>nt",
            ":lua require('neogen').generate({ type = 'type' })<CR>",
            desc = "Neogen type",
            silent = true,
            noremap = true,
        },
        {
            "<Leader>nd",
            ":lua require('neogen').generate({ type = 'file' })<CR>",
            desc = "Neogen file",
            silent = true,
            noremap = true,
        },
    },
}
