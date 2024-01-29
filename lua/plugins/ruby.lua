return {
    -- lspconfig
    "neovim/nvim-lspconfig",

    opts = {
        servers = {
            solargraph = {},
            html = {},
            stimulus_ls = {
                filetypes = { "html", "eruby", "erb", "blade", "php" },
      },
        },

        setup = {
            solargraph = function(_, opts)
                local lspconfig = require("lspconfig")
                local capabilities = require("cmp_nvim_lsp").default_capabilities()

                lspconfig.solargraph.setup({
                    capabilities = capabilities,
                    filetypes = { "ruby" },
                    settings = {
                        solargraph = {
                            useBundler = true,
                            diagnostic = true,
                            completion = true,
                            hover = true,
                            formatting = true,
                            symbols = true,
                            definitions = true,
                            rename = true,
                            references = true,
                            folding = true,
                            autoformat = false,
                        },
                    },
                })
            end,

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
}
