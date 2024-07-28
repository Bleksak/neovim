return {
    {
        "sainnhe/everforest",
        priority = 1000,
        lazy = false,
        enabled = false,
        config = function()
            vim.cmd("let g:everforest_background = 'medium'")
            vim.cmd("let g:everforest_better_performance = 1")
            vim.cmd("set background=dark")
            vim.cmd("colorscheme everforest")
        end
    },

    {
        "maxmx03/solarized.nvim",
        priority = 1000,
        lazy = false,
        enabled = true,

        opts = {
            palette = 'selenized',
            theme = 'neo'
        },

        config = function(_, opts)
            require("solarized").setup(opts)
            vim.o.background = 'dark'
            vim.cmd("colorscheme solarized")
        end
    },

    {
        "olivercederborg/poimandres.nvim",
        enabled = false,
        priority = 1000,
        lazy = false,
        config = function()
            require("poimandres").setup()
            vim.o.background = 'dark'
            vim.cmd("colorscheme poimandres")
        end
    }
}
