local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").svelte.setup({
    capabilities = capabilities,
})
