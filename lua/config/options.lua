vim.o.updatetime = 250
vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting
vim.g.autoformat = false
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false

vim.opt.pumwidth = 40
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.signcolumn = "yes"
-- vim.o.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T"
vim.o.statuscolumn = "%s %l %C"
vim.o.laststatus = 3
vim.o.termguicolors = true

vim.o.conceallevel = 2
vim.o.timeout = false
vim.o.timeoutlen = 0

-- TODO: figure out what to export so that tmux doesnt break
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,globals,help,localoptions,options,skiprtp,resize,winpos,tabpages,winsize,terminal"


if not vim.env.SSH_TTY then
    -- if vim.fn.executable("xclip") == 1 then
    --     vim.g.clipboard = {
    --         copy = {
    --             ["+"] = "xclip -selection clipboard",
    --             ["*"] = "xclip -selection clipboard",
    --         },
    --         paste = {
    --             ["+"] = "xclip -selection clipboard -o",
    --             ["*"] = "xclip -selection clipboard -o",
    --         },
    --     }
    -- else
        vim.g.clipboard = {
            copy = {
                ["+"] = "wl-copy --primary -n",
                ["*"] = "wl-copy --primary -n",
            },
            paste = {
                ["+"] = "wl-paste --primary",
                ["*"] = "wl-paste --primary",
            },
        }
    -- end

    vim.o.clipboard = "unnamedplus"
end

local function snippetfilter(line_to_cursor, base)
    return function(s)
        return not s.hidden and vim.startswith(s.trigger, base) and s.show_condition(line_to_cursor)
    end
end

local function snippet_to_cmp(item)
    return {
        word = item.trigger,
        kind = "Snippet",
        dup = false,
        empty = false,
        menu = item.name,
        user_data = "luasnip",
        info = vim.trim(table.concat(
        -- vim.tbl_flatten({ item.dscr or "", "", item:get_docstring() }), "\n"
            vim.iter({ item.dscr or "", "", item:get_docstring() }):flatten():totable()
        )),
    }
end

function LuasnipCompletion(findstart, base)
    local line, col = vim.api.nvim_get_current_line(), vim.api.nvim_win_get_cursor(0)[2]
    local line_to_cursor = line:sub(1, col)

    if findstart == 1 then
        return vim.fn.match(line_to_cursor, "\\k*$")
    end

    local luasnip = require("luasnip")

    local cmp_list = vim.tbl_map(
        snippet_to_cmp,
        vim.tbl_filter(
            snippetfilter(line_to_cursor, base),
            vim.list_extend(luasnip.get_snippets("all"), luasnip.get_snippets(vim.bo.filetype))
        )
    )

    table.sort(cmp_list, function(a, b)
        return a.word < b.word
    end)

    return cmp_list
end

vim.api.nvim_create_autocmd("CompleteDone", {
    callback = function(opts)
        local luasnip = require("luasnip")

        local comp = vim.v.completed_item or nil
        local user_data = comp.user_data
        local item = vim.tbl_get(comp, 'user_data', 'nvim', 'lsp', 'completion_item') or nil
        local word = vim.tbl_get(comp, 'word') or nil


        if (user_data == "luasnip" or (item and item.user_data == "luasnip")) and luasnip.expandable() then
            luasnip.expand()
            return
        end

        -- print(vim.inspect(item))

        if not item then
            return
        end

        local snip_text = vim.tbl_get(item, 'textEdit', 'newText') or vim.tbl_get(item, 'insertText') or vim.tbl_get(item, 'label') or ''

        -- vim.snippet.expand(vim.v.completed_item.word)
        if (
                not item.insertTextFormat
                or item.insertTextFormat == 1
                -- or not item.insertText
                or snip_text == ''
            ) then
            return
        end

        local cursor = vim.api.nvim_win_get_cursor(0)
        local line = vim.api.nvim_get_current_line()
        local lnum = cursor[1] - 1
        local start_char = cursor[2] - #comp.word
        vim.api.nvim_buf_set_text(opts.buf, lnum, start_char, lnum, start_char + #word, { '' })

        -- {
        --   insertTextFormat = 2,
        --   kind = 1,
        --   label = "BufEnter",
        --   sortText = "0009"
        -- }

        -- local snip_text = vim.tbl_get(item, 'textEdit', 'newText') or item.insertText or item.label
        assert(snip_text, "Language server indicated it had a snippet, but no snippet text could be found!")
        vim.snippet.expand(snip_text)
    end,
})

-- vim.o.completefunc = "v:lua.LuasnipCompletion"

vim.o.omnifunc = "v:lua.MiniCompletion.completefunc"
vim.o.completefunc = "v:lua.MiniCompletion.completefunc"
--
-- vim.api.nvim_command('set completefunc=v:lua.MiniCompletion.completefunc')
-- vim.api.nvim_command('set omnifunc=v:lua.MiniCompletion.completefunc')

-- vim.cmd.colorscheme 'wildcharm'
