return {
    {
        "neovim/nvim-lspconfig",

        opts = {
            servers = {
                html = {},
                phpactor = {
                    init_options = {
                        ["language_server_completion.trim_leading_dollar"] = true,
                        ["language_server_phpstan.enabled"] = false,
                        ["language_server_psalm.enabled"] = false,
                        ["language_server_php_cs_fixer.enabled"] = false,
                        ["php_code_sniffer.enabled"] = false,
                        ["symfony.enabled"] = vim.fn.filereadable("bin/console") == 1,
                        ["core.min_memory_limit"] = 5368709120,
                        ["completion.limit"] = 100,
                        ["language_server_code_transform.import_globals"] = true,
                        ["language_server_worse_reflection.inlay_hints.enable"] = true,
                        ["language_server_worse_reflection.inlay_hints.types"] = true,
                        ["language_server_configuration.auto_config"] = false,
                    },
                },
                neon_ls = {}
            },
            setup = {
                neon_ls = function(_, opts)
                    local lspconfig = require("lspconfig")
                    local configs = require("lspconfig.configs")

                    configs.neon_ls = {
                        default_config = {
                            cmd = { "~/dev/neon-lsp/application", "lsp" },
                            filetypes = { "neon" },
                            root_dir = function(fname)
                                return lspconfig.util.find_git_ancestor(fname)
                            end,
                            settings = {},
                        },
                    }
                end
            }
        },
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            local b = nls.builtins
            opts.sources = vim.tbl_extend("force", opts.sources, {
    --             -- b.diagnostics.phpstan,
    --             -- b.diagnostics.phpcs,
    --             -- b.diagnostics.phpcs.with({
    --             --     extra_args = { "--standard=PSR12" },
    --             -- }),
    --             b.diagnostics.phpmd.with({
    --                 extra_args = { "controversial", "design", "unusedcode", "codesize", "naming", },
    --             }),
    --
    --             -- b.formatting.prettierd,
    --             -- b.formatting.phpcsfixer,
    --             -- b.formatting.phpcbf,
                b.formatting.pretty_php,
            })
            return opts
        end,
    }
}
