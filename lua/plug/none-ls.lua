local nls = require("null-ls")
local builtins = nls.builtins

local sources = {
    builtins.formatting.stylua,
    -- builtins.formatting.prettier,
    builtins.formatting.prettierd,
    -- builtins.formatting.biome,
    builtins.formatting.blade_formatter
}

if vim.fn.filereadable("pint.json") ~= 0 then
    table.insert(sources, builtins.formatting.pint)
end

local phpcbf_path = vim.loop.cwd() .. "/vendor/bin/phpcbf"
if vim.fn.filereadable(phpcbf_path) ~= 0 then
    local args = {
        '--parallel=8',
        '--extensions=php,phpt',
        '--encoding=utf8',
        '--tab-width=4',
        '--colors',
        '-sp',
        '--runtime-set', 'php_version', '070430',
    }

    local cs_config = vim.loop.cwd() .. "/tools/cs/ruleset.xml"

    if vim.fn.filereadable(cs_config) ~= 0 then
        table.insert(args, '--standard=' .. cs_config)
    end

    table.insert(sources, builtins.formatting.phpcbf.with(
        {
            extra_args = args,
            prefer_local = "vendor/bin",
            cwd = function()
                return vim.loop.cwd()
            end
        }
    ))
end

local phpcs_path = vim.loop.cwd() .. "/vendor/bin/phpcs"
if vim.fn.filereadable(phpcs_path) ~= 0 then
    local args = {
        '--parallel=8',
        '--extensions=php,phpt',
        '--encoding=utf8',
        '--tab-width=4',
        '--colors',
        '-sp',
        '--runtime-set php_version 070430'
    }

    local cs_config = vim.loop.cwd() .. "/tools/cs/ruleset.xml"

    if vim.fn.filereadable(cs_config) ~= 0 then
        table.insert(args, '--standard=' .. cs_config)
    end

    table.insert(sources, builtins.diagnostics.phpcs.with(
        {
            extra_args = args,
            prefer_local = "vendor/bin",
            cwd = function()
                return vim.loop.cwd()
            end
        }
    ))
end

local stan_config_path = vim.loop.cwd() .. "/tools/phpstan/phpstan.neon"

if vim.fn.filereadable(stan_config_path) ~= 0 then
    table.insert(sources, builtins.diagnostics.phpstan.with(
        {
            prefer_local = "vendor/bin",
            temp_dir = "/tmp",
            extra_args = {
                -- "-c " .. stan_config_path,
                "--memory-limit=4G",
            },
            cwd = function()
                return vim.loop.cwd()
            end
            -- method=nls.methods.DIAGNOSTICS_ON_SAVE,
            -- to_temp_file = false,
        }
    ))

end

local cs_fixer_config = vim.loop.cwd() .. "/.php-cs-fixer.php"
if vim.fn.filereadable(cs_fixer_config) ~= 0 then
    table.insert(sources, builtins.formatting.phpcsfixer.with(
        {
            prefer_local = "vendor/bin",
            cwd = function()
                return vim.loop.cwd()
            end
        }
    ))
end

nls.setup {}

require("null-ls.sources").register(sources)
