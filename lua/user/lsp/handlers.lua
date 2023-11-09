local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

local function on_list(options)
    vim.fn.setqflist({}, ' ', options)
    vim.api.nvim_command('cfirst')
end

local function lsp_error_handler(error)
    print ("Nothing to show")
end

M.setup = function()
    local signs = {

        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = false, -- disable virtual text
        signs = {
            active = signs, -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "gD", function() vim.lsp.buf.declaration({on_list=on_list}) end, opts)
keymap("n", "gd", function() vim.lsp.buf.definition({on_list=on_list}) end, opts)
keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
keymap("n", "gi", function() vim.lsp.buf.implementation({on_list=on_list}) end, opts)
keymap("n", "gr", function() vim.lsp.buf.references() end, opts)
keymap("n", "gl", function() vim.diagnostic.open_float() end, opts)
keymap("n", "<leader>lf", function() vim.lsp.buf.format{ async = true } end, opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
keymap("n", "<F3>", function() vim.diagnostic.goto_next({buffer=0}) end, opts)
keymap("n", "<F4>", function() vim.diagnostic.goto_prev({buffer=0}) end, opts)
keymap("n", "<leader>lj", function() vim.diagnostic.goto_next({buffer=0}) end, opts)
keymap("n", "<leader>lk", function() vim.diagnostic.goto_prev({buffer=0}) end, opts)
keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
keymap("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
keymap("n", "<leader>lq", function() vim.diagnostic.setloclist() end, opts)
keymap("n", "gqn", function() pcall(vim.cmd, {cmd='cnext', bang=true}) end, opts)
keymap("n", "gqN", function() pcall(vim.cmd, {cmd='cprevious', bang=true}) end, opts)

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    -- lsp_keymaps(bufnr)
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

return M
