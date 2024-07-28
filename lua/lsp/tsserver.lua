local lspconfig = require("lspconfig")

lspconfig.tsserver.setup {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        implicitProjectConfiguration = { checkJs = true },
    },
    completions = {
        completeFunctionCalls = true,
    },
    -- on_attach = function(client, _)
    --     client.resolved_capabilities.document_formatting = false
    -- end
}
