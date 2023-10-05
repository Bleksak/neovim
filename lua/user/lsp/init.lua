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
local configs = require('lspconfig.configs')

local handlers = require("user.lsp.handlers")

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = handlers.on_attach
    }
  end
}

-- lspconfig.phpactor.setup {
--   cmd = {"phpactor", "language-server"},
--   filetypes = {"php", "blade"},
--   root_dir = lspconfig.util.root_pattern("composer.json"),
--   on_attach = handlers.on_attach,
-- }
--
-- configs.laravel = {
--   default_config = {
--     cmd = { "laravel-dev-tools", "lsp" },
--     filetypes = {'blade', 'php'};
--     root_dir = lspconfig.util.root_pattern("artisan"),
--     settings = {};
--   };
-- }

-- lspconfig.laravel.setup {
--   capabilities = {}
-- }
