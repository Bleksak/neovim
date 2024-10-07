-- NOTE: uncomment this when using luasnip
-- vim.cmd([[
--     augroup LeaveInsert
--         autocmd InsertLeave * lua if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()] then require("luasnip").unlink_current() end
--     augroup end
-- ]])

-- vim.api.nvim_exec([[
-- autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
-- autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
-- " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
-- ]], true)

-- vim.api.nvim_create_autocmd(
--     "FileType", {
--         pattern = { "qf" },
--         command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
--     }
-- )

vim.api.nvim_create_autocmd(
    { "BufReadPost", "LspAttach" }, {
        pattern = { "*" },
        command = "normal! zR<CR>"
    }
)

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" },
    {
        pattern = { "*.neon" },
        command = "setfiletype neon",
    }
)

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" },
    {
        pattern = { "*.blade.php" },
        command = "setfiletype blade",
    }
)

-- vim.api.nvim_create_autocmd(
--     "LspAttach",
--     {
--         callback = function(ev)
--             vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--             vim.keymap.set("i", "<Tab>", function()
--                 if vim.fn.pumvisible() ~= 0 then
--                     return "<C-n>"
--                 end
--
--                 return "<Tab>"
--             end, { expr = true })
--
--             vim.keymap.set("i", "<S-Tab>", function()
--                 if vim.fn.pumvisible() ~= 0 then
--                     return "<C-p>"
--                 end
--
--                 return "<S-Tab>"
--             end, { expr = true })
--
--             vim.keymap.set("i", "<C-Space>", function()
--                 if vim.fn.pumvisible() == 0 then
--                     return vim.api.nvim_replace_termcodes("<C-x><C-o>", true, true, true)
--                 end
--             end, { expr = true })
--         end
--     }
-- )

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "mysql", "sql", "plsql" },
    callback = function(ev)
        vim.cmd[[setlocal completefunc=vim_dadbod_completion#omni]]
        vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { buffer = ev.buf })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    -- command = [[setlocal omnifunc=v:lua.MiniCompletion.completefunc_lsp]]
    command = [[setlocal completefunc=v:lua.MiniCompletion.completefunc_lsp]]
})

-- set latte commentstring
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "latte" },
    -- command = "setlocal commentstring={*%s*}",
    callback = function()
        vim.schedule(function()
            vim.bo.commentstring = "{*%s*}"
        end)
    end
})
