local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.formatting = nil

lspconfig.ts_ls.setup({
    capabilities = capabilities,
    settings = {
        implicitProjectConfiguration = { checkJs = true },
    },
    completions = {
        completeFunctionCalls = true,
    },
    -- on_attach = function(client, _)
    --     client.resolved_capabilities.document_formatting = false
    -- end

    on_attach = function(client, bufnr)
        vim.lsp.buf.format({ filter = function(format_client)
            if format_client.name == "null-ls" then
                return true
            end

            return false
        end, bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 10000 })
    end,
})
