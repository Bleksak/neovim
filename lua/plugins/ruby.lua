return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        },

        opts = {
            servers = {
                ruby_lsp = {},
                -- solargraph = {},
                html = {},
                stimulus_ls = {
                    filetypes = { "html", "eruby", "erb", "blade", "php" },
                },
                cssls = {
                    settings = {
                        css = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore",
                            },
                        },
                        scss = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore",
                            },
                        },
                        less = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore",
                            },
                        },
                    },
                },
            },

            setup = {
                -- solargraph = function(_, opts)
                --     local lspconfig = require("lspconfig")
                --     local capabilities = require("cmp_nvim_lsp").default_capabilities()
                --
                --     lspconfig.solargraph.setup({
                --         capabilities = capabilities,
                --         filetypes = { "ruby" },
                --         settings = {
                --             solargraph = {
                --                 useBundler = true,
                --                 diagnostic = true,
                --                 completion = true,
                --                 hover = true,
                --                 formatting = true,
                --                 symbols = true,
                --                 definitions = true,
                --                 rename = true,
                --                 references = true,
                --                 folding = true,
                --                 autoformat = false,
                --             },
                --         },
                --     })
                -- end,

                html = function(_, opts)
                    local lspconfig = require("lspconfig")
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    lspconfig.html.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "eruby", "erb", "blade", "php" },
                    })
                end,

                stimulus_ls = function(_, opts)
                    local lspconfig = require("lspconfig")
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    lspconfig.stimulus_ls.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "eruby", "erb", "blade", "php" },
                    })
                end,
            },
        },
    },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         {
    --             "jmbuhr/otter.nvim",
    --             dependencies = {
    --                 "neovim/nvim-lspconfig",
    --                 "nvim-treesitter/nvim-treesitter",
    --             },
    --             opts = {
    --                 buffers = {
    --                     set_filetype = true,
    --                     write_to_disk = false,
    --                 },
    --             },
    --         },
    --     },
    --     opts = function(_, opts)
    --         table.insert(opts.sources, 1, {
    --             name = "otter",
    --             group_index = 1,
    --             priority = 100,
    --         })
    --     end
    -- },
}
