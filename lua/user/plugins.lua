local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- user experience
    "nvim-lua/plenary.nvim", 
    "nvim-lua/popup.nvim",
    "numToStr/Comment.nvim",
    "akinsho/bufferline.nvim",
    "moll/vim-bbye",
    "akinsho/toggleterm.nvim",
    "folke/which-key.nvim",
    -- explorer
    "nvim-tree/nvim-tree.lua",
    -- status bar
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",

    -- formatting
    "lukas-reineke/indent-blankline.nvim",
    -- autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'windwp/nvim-autopairs',
            'FelipeLema/cmp-async-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
            'Exafunction/codeium.nvim',
            'nvim-lua/plenary.nvim',
        },
    },
    "gelguy/wilder.nvim",
    "fpob/nette.vim",

    -- comment jsx
    "JoosepAlviste/nvim-ts-context-commentstring",

    --highlighting
    "nvim-treesitter/nvim-treesitter",
    -- "RRethy/vim-illuminate",

    -- LSP
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        -- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {"rafamadriz/friendly-snippets"}
    },
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jwalton512/vim-blade",

    -- Project management
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    -- Scrolling
    -- "karb94/neoscroll.nvim",

    -- View images
    -- "edluffy/hologram.nvim",
    -- "dharmx/telescope-media.nvim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            keywords = {

            }
        }
    },

    "weilbith/nvim-code-action-menu",

    -- load/save
    "mrquantumcodes/retrospect.nvim",

    "ggandor/leap.nvim",
    "ggandor/flit.nvim",

    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    'lewis6991/gitsigns.nvim',
    'nvim-treesitter/playground',
    'rescript-lang/vim-rescript',

    -- Theme
    "marko-cerovac/material.nvim",
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
})
