return {
    {
        "neovim/nvim-lspconfig",
        event = "LazyFile",
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
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()

                    configs.blade = {
                        default_config = {
                            cmd = { "/home/bleksak/laravel-dev-tools/builds/laravel-dev-tools", "lsp" },
                            filetypes = { "blade", "php" },
                            root_dir = function(fname)
                                return lspconfig.util.find_git_ancestor(fname)
                            end,
                            settings = {},
                        },
                    }

                    lspconfig.blade.setup({
                        capabilities = capabilities,
                        -- on_attach = handlers.on_attach,
                    })
                end,
            },
        },
    },
}
