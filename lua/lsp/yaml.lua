local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").yamlls.setup({
    capabilities = capabilities,
})
