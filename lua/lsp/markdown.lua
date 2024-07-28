local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.workspace = {
    didChangeWatchedFiles = {
        dynamicRegistration = true
    }
}

lspconfig.marksman.setup {
    cmd = { "marksman", "server" },
}

lspconfig.markdown_oxide.setup {
    capabilities = capabilities
}
