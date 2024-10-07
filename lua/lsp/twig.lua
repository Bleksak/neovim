local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").twiggy_language_server.setup({
    capabilities = capabilities,
})
