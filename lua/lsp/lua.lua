local lspconfig = require("lspconfig")

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup {
    -- capabilities = capabilities,
    cmd = { "lua-language-server" },
    settings = {
        Lua = {},
    },
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = true,
            -- library = {
            --   vim.env.VIMRUNTIME
            --   -- Depending on the usage, you might want to add additional paths here.
            --   -- "${3rd}/luv/library"
            --   -- "${3rd}/busted/library",
            -- }
            library = vim.api.nvim_get_runtime_file("", true)
          }
        })
  end,
}