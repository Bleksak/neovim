local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_language_server.setup {
    capabilities = capabilities,
    filetypes = {
        "html", "blade", "latte", "css", "eruby", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "typescriptreact", "htmlangular", "twig"
    }
}

