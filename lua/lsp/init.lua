vim.diagnostic.config({
    underline = true,
    update_in_insert = true,
    virtual_text = false,
    -- virtual_text = {
    --     spacing = 4,
    --     prefix = "●",
    -- },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
    -- float = {
    --     focusable = false,
    --     close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --     border = 'rounded',
    --     source = 'if_many',
    --     prefix = ' ',
    --     scope = 'cursor',
    -- }
})

vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
vim.keymap.set("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_references()<cr>", { desc = "Find references" })
vim.keymap.set("n", "gi", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", { desc = "Find implementation" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { desc = "Format buffer" })
vim.keymap.set("n", "<leader>ca",
    "<cmd>lua require('fzf-lua').lsp_code_actions({winopts = { preview = { layout = 'vertical' } }})<CR>",
    { desc = "Code actions" })
vim.keymap.set("n", "<leader>cd",
    "<cmd>lua require('fzf-lua').lsp_document_diagnostics({winopts = { preview = { layout = 'vertical' } }})<CR>",
    { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>cD",
    "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({winopts = { preview = { layout = 'vertical' } }})<CR>",
    { desc = "Workspace diagnostics" })

require("lsp.php")
require("lsp.blade")
require("lsp.lua")
require("lsp.markdown")
require("lsp.html")
require("lsp.tsserver")
require("lsp.svelte")
require("lsp.emmet")
require("lsp.yaml")
require("lsp.antlers")
require("lsp.twig")
require("lsp.css")
require("lsp.angularls")
require("lsp.biome")

require("diagflow").setup({
    scope = "line",
})

