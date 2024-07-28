return {
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
    {
        event = "VeryLazy",
        -- friendly snippets
        "rafamadriz/friendly-snippets",
        dependencies = {
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local luasnip = require("luasnip")
            local loaders = require("luasnip.loaders.from_vscode")
            loaders.lazy_load()

            local list_snippets = function()
                local ft_list = luasnip.available()[vim.o.filetype]
                local ft_snips = {}
                for _, item in ipairs(ft_list) do
                    ft_snips[item.trigger] = item.name
                end

                print(vim.inspect(ft_snips))
            end

            -- vim.o.completefunc = "v:lua.LuasnipCompletion"
            vim.api.nvim_create_user_command("SnipList", list_snippets, {})
        end,

        keys = {
            {
                "<C-l>",
                function()
                    if require("luasnip").expand_or_jumpable() then
                        require("luasnip").expand_or_jump()
                    end
                    if vim.snippet.active({direction = 1}) then
                        vim.snippet.jump(1)
                    end
                end,
                mode = { "i", "s" },
                desc = "Expand or jump",
            },
            {
                "<C-h>",
                function()
                    if require("luasnip").locally_jumpable(-1) then
                        require("luasnip").jump(-1)
                    end
                    if vim.snippet.active({direction = -1}) then
                        vim.snippet.jump(-1)
                    end
                end,
                mode = { "i", "s" },
                desc = "Jump backward",
            }
        },
    },
}
