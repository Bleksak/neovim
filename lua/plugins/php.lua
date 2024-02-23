return {
    "neovim/nvim-lspconfig",

    opts = {
        servers = {
            html = {},
            stimulus_ls = {
                filetypes = { "html", "eruby", "erb", "blade", "php" },
            },
            phpactor = {
                init_options = {
                    ["language_server_completion.trim_leading_dollar"] = true,
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                    ["language_server_php_cs_fixer.enabled"] = false,
                    ["php_code_sniffer.enabled"] = false,
                    ["symfony.enabled"] = true,
                    ["core.min_memory_limit"] = 5368709120,
                    ["completion.limit"] = 100,
                    ["language_server_code_transform.import_globals"] = true,
                    ["language_server_worse_reflection.inlay_hints.enable"] = true,
                    ["language_server_worse_reflection.inlay_hints.types"] = true,
                    ["language_server_configuration.auto_config"] = false,
                }
            }
        },
    },
}
