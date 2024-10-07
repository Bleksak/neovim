local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local init_options = {
--     ["language_server_completion.trim_leading_dollar"] = true,
--     -- ["language_server_phpstan.enabled"] = true,
--     -- ["language_server_phpstan.bin"] = vim.fn.expand('~/.config/composer/vendor/bin/phpstan'),
--     -- ["language_server_phpstan.level"] = 'max',
--     ["language_server_psalm.enabled"] = false,
--     ["php_code_sniffer.enabled"] = false,
--     ["php_code_sniffer.args"] = { '--standard=/home/bleksak/job/mailovatko/tools/cs/ruleset.xml' },
--     ["php_code_sniffer.bin"] = '%project_root%/vendor/bin/phpcs',
--     ["symfony.enabled"] = vim.fn.filereadable("bin/console") == 1 and
--         vim.fn.isdirectory("public") == 1,
--     ["core.min_memory_limit"] = 5368709120,
--     ["completion.limit"] = 150,
--     -- ["language_server_code_transform.import_globals"] = true,
--     ["language_server_worse_reflection.inlay_hints.enable"] = false,
--     ["language_server_worse_reflection.inlay_hints.types"] = false,
--     ["language_server_configuration.auto_config"] = false,
--     ["language_server.diagnostics_on_update"] = false,
-- }
--
-- if vim.fn.filereadable(".php-cs-fixer.php") ~= 0 then
--     init_options = vim.tbl_deep_extend("force", init_options, {
--         ["language_server_php_cs_fixer.enabled"] = true,
--         ["language_server_php_cs_fixer.bin"] = vim.fn.expand(
--             '~/.config/composer/vendor/bin/php-cs-fixer'),
--         ["language_server_php_cs_fixer.config"] = '%project_root%/.php-cs-fixer.php',
--     })
-- end

-- lspconfig.phpactor.setup {
--     on_attach = function(client, bufnr)
--     end,
--     cmd = { "phpactor", "language-server" },
--     root_dir = function(fname)
--         local cwd = vim.loop.cwd()
--         local root = lspconfig.util.root_pattern("composer.json", ".git", ".phpactor.json", ".phpactor.yml")(fname)
--
--         return lspconfig.util.path.is_descendant(cwd, root) and cwd or root
--     end,
--     init_options = init_options,
--     -- single_file_support = true
-- }

lspconfig.intelephense.setup {
    init_options = {
    },

    capabilities = capabilities,

    on_attach = function(_, _)
        vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format({ filter = function(format_client)
                if format_client.name == "null-ls" then
                    return true
                end

                return false
            end, bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 10000 })
        end)
    end
}
