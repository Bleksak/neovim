local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

local lspzero = require('lsp-zero').preset({})


lspzero.setup()

local handlers = require("user.lsp.handlers")

handlers.setup()

lspconfig.phpactor.setup {
  cmd = {"phpactor", "language-server"},
  filetypes = {"php", "blade"},
  root_dir = lspconfig.util.root_pattern("composer.json"),
  on_attach = handlers.on_attach,
}

configs.laravel = {
  default_config = {
    cmd = { "laravel-dev-tools", "lsp" },
    filetypes = {'blade', 'php'};
    root_dir = lspconfig.util.root_pattern("artisan"),
    settings = {};
  };
}

lspconfig.laravel.setup {
  capabilities = {}
}