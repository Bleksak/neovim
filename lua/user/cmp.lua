-- Set up nvim-cmp.
local cmp = require'cmp'
require("luasnip.loaders.from_vscode").lazy_load()
require("wilder").setup({modes = {':', '/', '?'}})
require('codeium').setup()

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<tab>'] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end),

    ['<S-tab>'] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end),
  }),
  formatting = {
      fields = { "abbr", "menu", "kind" },
      format = function(entry, item)
          -- Define menu shorthand for different completion sources.
          local menu_icon = {
              nvim_lsp    = "NLSP",
              nvim_lua    = "NLUA",
              -- luasnip     = "LSNP",
              buffer      = "BUFF",
              path        = "PATH",
              codeium     = "AI",
          }
          -- Set the menu "icon" to the shorthand for each completion source.
          item.menu = menu_icon[entry.source.name]

          -- Set the fixed width of the completion menu to 60 characters.
          -- fixed_width = 20

          -- Set 'fixed_width' to false if not provided.
          local fixed_width = 100
          -- local fixed_width = fixed_width or false

          -- Get the completion entry text shown in the completion window.
          local content = item.abbr

          -- Set the fixed completion window width.
          if fixed_width then
              vim.o.pumwidth = fixed_width
          end

          -- Get the width of the current window.
          local win_width = vim.api.nvim_win_get_width(0)

          -- Set the max content width based on either: 'fixed_width'
          -- or a percentage of the window width, in this case 20%.
          -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
          local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

          -- Truncate the completion entry text if it's longer than the
          -- max content width. We subtract 3 from the max content width
          -- to account for the "..." that will be appended to it.
          if #content > max_content_width then
              item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
          else
              item.abbr = content .. (" "):rep(max_content_width - #content)
          end
          return item
      end,
  },
  matching = {
    disallow_fuzzy_matching = false,
  },
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
      end
    },
    { name = "nvim_lua" },
    { name = "codeium" },
    -- { name = "luasnip" },
  }, {
    { name = 'buffer' },
  }, {
    { name = "nvim_lsp_signature_help" },
  }, {
      { name = "path" }
  })
})

