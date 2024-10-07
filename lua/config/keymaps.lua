-- set leader
vim.g.mapleader = " "

_G.CloseAllFloatingWindows = function()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then -- is_floating_window?
            vim.api.nvim_win_close(win, true) -- do not force
            table.insert(closed_windows, win)
        end
    end
    -- print(string.format("Closed %d windows: %s", #closed_windows, vim.inspect(closed_windows)))
end

vim.api.nvim_create_user_command("CloseAllFloatingWindows", CloseAllFloatingWindows, {})

vim.keymap.set("n", "<leader>wc", CloseAllFloatingWindows, { desc = "Close all floating windows" })
vim.keymap.set("n", "<Esc>", CloseAllFloatingWindows, { desc = "Close all floating windows" })

local keys = {
    ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
    ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
    ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
}

_G.cr_action = function()
    if vim.fn.pumvisible() ~= 0 then
      -- If popup is visible, confirm selected item or add new line otherwise
      local item_selected = vim.fn.complete_info()['selected'] ~= -1
      return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
    else
      -- If popup is not visible, use plain `<CR>`. You might want to customize
      -- according to other plugins. For example, to use 'mini.pairs', replace
      -- next line with `return require('mini.pairs').cr()`
      return keys['cr']
    end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = "Clear search highlight" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- nnoremap <C-j> <C-w>j
-- nnoremap <C-k> <C-w>k
-- nnoremap <C-h> <C-w>h
-- nnoremap <C-l> <C-w>l

vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- remove annoying default keymaps
vim.keymap.del({ 'n', 'x' }, 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grn')
