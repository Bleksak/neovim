local lspconfig = require("lspconfig")

-- lspconfig.setup({
--     diagnostics = {
--         underline = true,
--         update_in_insert = false,
--         virtual_text = {
--             spacing = 4,
--             prefix = "●",
--         },
--         severity_sort = true,
--         signs = {
--             text = {
--                 [vim.diagnostic.severity.ERROR] = "",
--                 [vim.diagnostic.severity.WARN] = "",
--                 [vim.diagnostic.severity.INFO] = "",
--                 [vim.diagnostic.severity.HINT] = "",
--             },
--         },
--     },
-- })

require("lsp.phpactor")
require("lsp.blade")
require("lsp.lua")
require("lsp.markdown")
require("lsp.html")
require("lsp.tsserver")
require("lsp.svelte")

