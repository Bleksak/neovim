-- local cmp = require("cmp")
--
-- cmp.setup({
--     performance = {
--         debounce = 0,
--         throttle = 0,
--     },
--     snippet = {
--         -- REQUIRED - you must specify a snippet engine
--         expand = function(args)
--             -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--             -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--             -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--             -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--             vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
--         end,
--     },
--     window = {
--         -- completion = cmp.config.window.bordered(),
--         -- documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<C-j>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             else
--                 fallback()
--             end
--         end),
--         ["<C-k>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             else
--                 fallback()
--             end
--         end),
--     }),
--     sources = cmp.config.sources({
--         { name = "laravel" },
--         { name = "nvim_lsp" },
--         -- { name = "vsnip" }, -- For vsnip users.
--         { name = "luasnip" }, -- For luasnip users.
--         -- { name = 'ultisnips' }, -- For ultisnips users.
--         -- { name = 'snippy' }, -- For snippy users.
--     }, {
--         { name = "buffer" },
--     }),
-- })

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]

local complete = require("mini.completion")

-- @param MiniCompletion opts
local opts = {
    delay = {
        completion = 0,
        info = 0,
        signature = 0,
    },

    window = {
        info = {
            height = 25,
            width = 80,
            border = "rounded",
        },

        signature = {
            height = 25,
            width = 80,
            border = "rounded",
        },
    },

    lsp_completion = {
        source_func = "completefunc", -- or completefunc
        auto_setup = false,
        process_items = function(items, base)
            local luasnip = require("luasnip")

            local function snippetfilter(line_to_cursor, base2)
                return function(s)
                    return not s.hidden and vim.startswith(s.trigger, base2) and s.show_condition(line_to_cursor)
                end
            end

            local function snippet_to_cmp(item)
                return {
                    word = item.trigger,
                    label = item.trigger,
                    kind = "Luasnip Snippet",
                    description = "Luasnip Snippet",
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

            local line, col = vim.api.nvim_get_current_line(), vim.api.nvim_win_get_cursor(0)[2]
            local line_to_cursor = line:sub(1, col)

            local snippet_list = {}
            if base ~= "" then
                snippet_list = vim.tbl_map(
                    snippet_to_cmp,
                    vim.tbl_filter(
                        snippetfilter(line_to_cursor, base),
                        vim.list_extend(luasnip.get_snippets("all"), luasnip.get_snippets(vim.bo.filetype))
                    )
                )
            end

            for _, v in ipairs(snippet_list) do
                table.insert(items, v)
            end

            local res = vim.tbl_filter(function(item)
                local cmp = require("mini.completion")
                -- Keep items which match the base and are not snippets
                local text = item.filterText or cmp.H.get_completion_word(item)

                return vim.startswith(text, base)
            end, items)

            table.sort(res,
                function(a, b) return (a.sortText or a.label or a.word) < (b.sortText or b.label or b.word) end)

            return res
        end,
    },

    mappings = {
        force_twostep = "<C-Space>",  -- Force two-step completion
        force_fallback = "<A-Space>", -- Force fallback completion
    },

    set_vim_settings = true,
}

vim.keymap.set("i", "<C-j>", "pumvisible() ? '<C-n>' : '<C-j>'", { expr = true })
vim.keymap.set("i", "<C-k>", "pumvisible() ? '<C-p>' : '<C-k>'", { expr = true })

complete.setup(opts)

vim.o.omnifunc = "v:lua.MiniCompletion.completefunc"
vim.o.completefunc = "v:lua.MiniCompletion.completefunc"

--
-- vim.api.nvim_command('set completefunc=v:lua.MiniCompletion.completefunc')
-- vim.api.nvim_command('set omnifunc=v:lua.MiniCompletion.completefunc')

-- require('cmp_nvim_lsp')

-- require('blink.cmp').setup({
--     highlight = {
--         -- sets the fallback highlight groups to nvim-cmp's highlight groups
--         -- useful for when your theme doesn't support blink.cmp
--         -- will be removed in a future release, assuming themes add support
--         use_nvim_cmp_as_default = true,
--     },
--     -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--     -- adjusts spacing to ensure icons are aligned
--     nerd_font_variant = 'normal',
--
--     -- experimental auto-brackets support
--     -- accept = { auto_brackets = { enabled = true } }
--
--     keymap = {
--         show = '<C-space>',
--         hide = '<C-e>',
--         accept = '<CR>',
--         select_prev = { '<Up>', '<C-k>' },
--         select_next = { '<Down>', '<C-j>' },
--
--         show_documentation = {},
--         hide_documentation = {},
--         scroll_documentation_up = '<C-b>',
--         scroll_documentation_down = '<C-f>',
--
--         snippet_forward = '<Tab>',
--         snippet_backward = '<S-Tab>',
--     },
--     fuzzy = {
--         -- frencency tracks the most recently/frequently used items and boosts the score of the item
--         use_frecency = false,
--         -- proximity bonus boosts the score of items with a value in the buffer
--         use_proximity = false,
--         max_items = 200,
--         -- controls which sorts to use and in which order, these three are currently the only allowed options
--         sorts = { 'label', 'kind', 'score' },
--     },
--     sources = {
--         -- similar to nvim-cmp's sources, but we point directly to the source's lua module
--         -- multiple groups can be provided, where it'll fallback to the next group if the previous
--         -- returns no completion items
--         providers = {
--             {
--                 { 'blink.cmp.sources.lsp' },
--                 { 'blink.cmp.sources.path' },
--                 -- { 'blink.cmp.sources.snippets', score_offset = -3 },
--             },
--             { { 'blink.cmp.sources.buffer' } },
--         },
--     },
--
--     trigger = {
--         completion = {
--             -- regex used to get the text when fuzzy matching
--             -- changing this may break some sources, so please report if you run into issues
--             -- todo: shouldnt this also affect the accept command? should this also be per language?
--             context_regex = '[%w_\\-]',
--             -- LSPs can indicate when to show the completion window via trigger characters
--             -- however, some LSPs (*cough* tsserver *cough*) return characters that would essentially
--             -- always show the window. We block these by default
--             blocked_trigger_characters = { ' ', '\n', '\t' },
--             -- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
--             show_on_insert_on_trigger_character = true,
--         },
--
--         signature_help = {
--             enabled = true,
--             blocked_trigger_characters = {},
--             blocked_retrigger_characters = {},
--             -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
--             show_on_insert_on_trigger_character = true,
--         },
--     },
-- })
