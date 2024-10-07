-- vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
-- bootstrap lazy.nvim, LazyVim and your plugins

require('config.options')
require('config.keymaps')
require('config.autocmds')
-- require("config.lazy")

-- vim.cmd("packloadall")

local cmp2lsp = require('cmp2lsp')

require('colorscheme')
require('plug.fzf')
require('plug.completion')
require('lsp')
require('plug.treesitter')
require('plug.lsp-file-operations')
require('plug.neotree')
require('plug.comment')
require('plug.bufferline')
require('plug.emmet')
require('plug.mpd')
require('plug.mini-move')
require('plug.rustacean')
require('plug.mini-ai')
require('plug.jsdoc')
require('plug.neogen')
require('plug.none-ls')
require('plug.markdown')
require('plug.diffthis')
require('plug.deletethis')
require('plug.cloak')
require('plug.lspecho')
require('plug.codeium')
require('plug.tmux')
require('plug.indent-blankline')
require('plug.which-key')
require('plug.dap')
require('plug.todo')
require('plug.snippets')
require('plug.laravel')
require('plug.in-and-out')
require('plug.bufdelete')
require('plug.ng')
require('plug.dotenv')
require('plug.flutter')
require('plug.autosession')

require("personal.phprunner")


-- quickfix list delete keymap
function Remove_qf_item()
    local curqfidx = vim.fn.line('.')
    local qfall = vim.fn.getqflist()

    -- Return if there are no items to remove
    if #qfall == 0 then return end

    -- Remove the item from the quickfix list
    table.remove(qfall, curqfidx)
    vim.fn.setqflist(qfall, 'r')

    -- Reopen quickfix window to refresh the list
    vim.cmd('copen')

    -- If not at the end of the list, stay at the same index, otherwise, go one up.
    local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

    -- Set the cursor position directly in the quickfix window
    local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
    vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

vim.cmd('command! RemoveQFItem lua Remove_qf_item()')
vim.api.nvim_command('autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>')

-- cmp2lsp.setup({
--     sources = {
--         { 'laravel' },
--         { 'lsp' }
--     }
-- })
