vim.keymap.set('n', '<leader>rp', function()
    vim.cmd('terminal php %')
end, { desc = 'Run PHP file', noremap = true, silent = true })
