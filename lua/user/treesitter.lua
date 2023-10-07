local treesitter = require "nvim-treesitter"
local configs = require "nvim-treesitter.configs"

require('ts_context_commentstring').setup {}

configs.setup {
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "php", "html", "javascript", "typescript", "json", "tsx", "scss", "svelte", "css", "twig" }, -- put the language you want in this array
  -- ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = { "" },                                                       -- List of parsers to ignore installing
  sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true,       -- false will disable the whole extension
    -- disable = { "" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    javascript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
    },

    typescript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
    }
  },
}

local parsers = require('nvim-treesitter.parsers').get_parser_configs()
parsers.blade = {
 install_info = {
   url = "https://github.com/EmranMR/tree-sitter-blade",
   files = {"src/parser.c"},
   branch = "main"
 },
 filetype = "blade"
}

parsers.latte = {
  install_info = {
    url = "https://github.com/whleucka/tree-sitter-latte",
    files = {"src/parser.c"},
    branch = "main"
  },
  filetype = "latte"
}

