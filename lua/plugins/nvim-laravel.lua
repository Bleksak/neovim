return {
    {
        "adalessa/laravel.nvim",
        -- event = {"BufReadPre", "BufNewFile"},
        event = "VeryLazy",
        branch = "2.1",

        enabled = function()
            return vim.fn.filereadable("artisan") ~= 0
        end,

        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },

        opts = {
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

            -- features = {
            --     null_ls = {
            --         enable = false,
            --     },
            -- },
        },

        config = function(_, opts)
            require("laravel").setup(opts)
        end,
    },
    {
        "adoolaard/nvim-cmp-laravel",
        enabled = false,
        -- enabled = function()
        --     return vim.fn.filereadable("artisan") ~= 0
        -- end,
        dependencies = {
            "hrsh7th/nvim-cmp",
        },

        opts = {},
    },
    {
        "jwalton512/vim-blade",

        event = { "BufReadPre", "BufNewFile" },

        enabled = function()
            return vim.fn.filereadable("artisan") ~= 0
        end,
    },
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim", opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        opts = {
            servers = {
                blade = {},
            },
            setup = {
                blade = function(_, opts)
                    local lspconfig = require("lspconfig")
                    local configs = require("lspconfig.configs")
                    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    configs.blade = {
                        default_config = {
                            cmd = { "/home/bleksak/laravel-dev-tools/builds/laravel-dev-tools", "lsp" },
                            filetypes = { "blade" },
                            root_dir = function(fname)
                                return lspconfig.util.find_git_ancestor(fname)
                            end,
                            settings = {},
                        },
                    }

                    lspconfig.blade.setup({
                        -- capabilities = capabilities,
                        -- on_attach = handlers.on_attach,
                    })
                end,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts = vim.tbl_deep_extend("force", opts, {
                servers = {
                    emmet_language_server = {
                        filetypes = { "blade" },
                    },
                    html = {
                        filetypes = { "blade" },
                    },
                }
            })

            return opts
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")

            return vim.tbl_deep_extend("force", opts, {
                sources = {
                    nls.builtins.formatting.blade_formatter,
                },
            })
        end,
    },
}
