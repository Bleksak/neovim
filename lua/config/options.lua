vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
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
vim.o.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum}  "
vim.o.laststatus = 3
vim.o.termguicolors = true

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
        info = vim.trim(table.concat(vim.tbl_flatten({ item.dscr or "", "", item:get_docstring() }), "\n")),
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
    callback = function()
        local luasnip = require("luasnip")

        if vim.v.completed_item.user_data == "luasnip" and luasnip.expandable() then
            luasnip.expand()
        end
    end,
})

vim.o.completefunc = "v:lua.LuasnipCompletion"

-- vim.o.omnifunc = "v:lua.MiniCompletion.completefunc"
-- vim.o.completefunc = "v:lua.MiniCompletion.completefunc"
--
-- vim.api.nvim_command('set completefunc=v:lua.MiniCompletion.completefunc')
-- vim.api.nvim_command('set omnifunc=v:lua.MiniCompletion.completefunc')

-- vim.opt.termguicolors = true
-- vim.cmd.colorscheme 'wildcharm'
