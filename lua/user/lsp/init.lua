require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')

local handlers = require("user.lsp.handlers")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers {
  function(server_name)

    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = handlers.on_attach
    }
  end
}

local lspconfig = require'lspconfig'
local configs = require 'lspconfig.configs'
configs.blade = {
  default_config = {
    cmd = { "laravel-dev-tools", "lsp" },
    filetypes = { "blade", "php" },
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname)
    end;
    settings = {}
  }
}

lspconfig.blade.setup {
  capabilities = capabilities,
  on_attach = handlers.on_attach,
}

-- keymap("n", "F1", "<cmd>CodeActionMenu<CR>", {'noremap': true})
vim.api.nvim_set_keymap('n', '<F1>', '<cmd>CodeActionMenu<CR>', { noremap = true })

