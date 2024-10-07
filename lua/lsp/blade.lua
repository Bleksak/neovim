local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()

configs.blade = {
    default_config = {
        cmd = { "/home/bleksak/laravel-dev-tools/laravel-dev-tools", "lsp" },
        filetypes = { "blade" },
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
        end,
        settings = {},
    },
}

-- lspconfig.blade.setup({
--     capabilities = capabilities,
--     -- on_attach = handlers.on_attach,
-- })
