-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.cmd([[
    augroup LeaveInsert
        autocmd InsertLeave * lua if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()] then require("luasnip").unlink_current() end
    augroup end
]])

vim.api.nvim_exec([[
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
]], true)

-- local group = vim.api.nvim_create_augroup("Ruby", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = "*.html.erb",
--   group = group,
--   callback = function()
--     local ok, otter = pcall(require, "otter")
--     if ok then
--       local query = '((code) @injection.content' ..
--           '(#set! injection.language "ruby")' ..
--           '(#set! injection.combined))'
--
--       otter.activate({ "ruby" }, true, true, query)
--
--       vim.api.nvim_buf_set_keymap(0, "n", "gS", ":lua require'otter'.ask_document_symbols()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "gd", ":lua require'otter'.ask_definition()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "gD", ":lua require'otter'.ask_type_definition()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua require'otter'.ask_hover()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "gr", ":lua require'otter'.ask_references()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "<leader>lR", ":lua require'otter'.ask_rename()<cr>", { silent = true })
--       vim.api.nvim_buf_set_keymap(0, "n", "<leader>lf", ":lua require'otter'.ask_format()<cr>", { silent = true })
--     end
--   end,
-- })
