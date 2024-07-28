local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
    cmd = { "lua-language-server" },
}
