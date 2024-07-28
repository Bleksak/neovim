return {
    {
        "neovim/nvim-lspconfig",

        opts = function(_, opts)
            if vim.fn.filereadable(".php-cs-fixer.php") ~= 0 then
                opts = vim.tbl_deep_extend("force", opts, {
                    servers = {
                        phpactor = {
                            init_options = {
                                ["language_server_php_cs_fixer.enabled"] = true,
                                ["language_server_php_cs_fixer.bin"] = vim.fn.expand(
                                    '~/.config/composer/vendor/bin/php-cs-fixer'),
                                ["language_server_php_cs_fixer.config"] = '%project_root%/.php-cs-fixer.php',
                            },
                        },
                        -- neon_ls = {}
                    }
                })
            end
            opts = vim.tbl_deep_extend("force", opts, {
                servers = {
                    -- phpactor = {
                    --     init_options = {
                    --         ["language_server_completion.trim_leading_dollar"] = true,
                    --         ["language_server_phpstan.enabled"] = false,
                    --         ["language_server_psalm.enabled"] = false,
                    --         -- ["php_code_sniffer.enabled"] = true,
                    --         -- ["php_code_sniffer.args"] = {'--standard=~/job/mailovatko/tools/cs/ruleset.xml'},
                    --         -- ["php_code_sniffer.bin"] = '%project_root%/vendor/bin/phpcs',
                    --         ["symfony.enabled"] = vim.fn.filereadable("bin/console") == 1 and
                    --             vim.fn.isdirectory("public") == 1,
                    --         ["core.min_memory_limit"] = 5368709120,
                    --         ["completion.limit"] = 150,
                    --         -- ["language_server_code_transform.import_globals"] = true,
                    --         ["language_server_worse_reflection.inlay_hints.enable"] = false,
                    --         ["language_server_worse_reflection.inlay_hints.types"] = false,
                    --         ["language_server_configuration.auto_config"] = false,
                    --     },
                    -- },
                    -- neon_ls = {}
                }
            })

            return opts
        end

        -- setup = {
        --     neon_ls = function(_, opts)
        --         local lspconfig = require("lspconfig")
        --         local configs = require("lspconfig.configs")
        --
        --         configs.neon_ls = {
        --             default_config = {
        --                 cmd = { "~/dev/neon-lsp/application", "lsp" },
        --                 filetypes = { "neon" },
        --                 root_dir = function(fname)
        --                     return lspconfig.util.find_git_ancestor(fname)
        --                 end,
        --                 settings = {},
        --             },
        --         }
        --     end
        -- }
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            local b = nls.builtins

            local sources = {
                -- b.diagnostics.phpstan.with({
                --     prefer_local = "vendor/bin",
                --     temp_dir = "/tmp",
                --     extra_args = {
                --         "-c ./tools/phpstan.neon",
                --     }
                -- }),
                -- b.diagnostics.phpcs.with({
                --     extra_args = {
                --         "--standard=./tools/cs/ruleset.xml",
                --     },
                --     prefer_local = "vendor/bin",
                -- }),
                -- b.diagnostics.phpcs.with({
                --     extra_args = { "--standard=PSR12" },
                -- }),
                -- b.diagnostics.phpmd.with({
                --     extra_args = { "controversial", "design", "unusedcode", "codesize", "naming", },
                -- }),
                --
                -- b.formatting.phpcsfixer.with({
                --     extra_args = { "--standard=./tools/cs/ruleset.xml" },
                --     prefer_local = "vendor/bin",
                -- }),
                -- b.formatting.phpcbf.with({
                --     extra_args = { "--standard=./tools/cs/ruleset.xml" },
                --     prefer_local = "vendor/bin",
                -- }),
                -- b.formatting.prettierd,
                -- b.formatting.pretty_php,
            }

            if vim.fn.filereadable("pint.json") ~= 0 then
                table.insert(sources, b.formatting.pint)
            end

            if vim.fn.filereadable("vendor/bin/phpcbf") ~= 0 then
                local args = {
                    '--parallel=8',
                    '--extensions=php,phpt',
                    '--encoding=utf8',
                    '--tab-width=4',
                    '--colors',
                    '-sp',
                    '--runtime-set', 'php_version', '070430',
                }

                if vim.fn.filereadable("tools/cs/ruleset.xml") ~= 0 then
                    table.insert(args, '--standard=' .. vim.loop.cwd() .. '/tools/cs/ruleset.xml')
                end

                table.insert(sources, b.formatting.phpcbf.with(
                    {
                        extra_args = args,
                        prefer_local = "vendor/bin",
                    }
                ))
            end

            if vim.fn.filereadable("vendor/bin/phpcs") ~= 0 then
                local args = {
                    '--parallel=8',
                    '--extensions=php,phpt',
                    '--encoding=utf8',
                    '--tab-width=4',
                    '--colors',
                    '-sp',
                    '--runtime-set', 'php_version', '070430',
                }

                if vim.fn.filereadable("tools/cs/ruleset.xml") ~= 0 then
                    table.insert(args, '--standard=' .. vim.loop.cwd() .. '/tools/cs/ruleset.xml')
                end

                table.insert(sources, b.diagnostics.phpcs.with(
                    {
                        extra_args = args,
                        prefer_local = "vendor/bin",
                    }
                ))
            end

            if vim.fn.filereadable("tools/cs/ruleset.xml") ~= 0 then
                table.insert(sources, b.diagnostics.phpstan.with(
                    {
                        prefer_local = "vendor/bin",
                        temp_dir = "/tmp",
                        extra_args = {
                            "-c " .. vim.loop.cwd() .. "/tools/phpstan/phpstan.neon",
                            "--memory-limit=3G",
                        }
                    }
                ))
            end

            if opts.sources == nil then
                opts.sources = {}
            end

            for _, s in ipairs(sources) do
                table.insert(opts.sources, s)
            end

            return opts
        end,
    }
}
