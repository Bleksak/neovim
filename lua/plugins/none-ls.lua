return {
    "nvimtools/none-ls.nvim",

    -- event = { "BufReadPre", "BufNewFile" },

    opts = function(_, opts)
        local nls = require("null-ls")

        local sources = {
            -- nls.builtins.formatting.stylua,
            -- nls.builtins.formatting.prettier,
            -- nls.builtins.formatting.prettierd,
            nls.builtins.formatting.biome,
            nls.builtins.formatting.blade_formatter
        }

        return vim.tbl_deep_extend("force", opts, { sources = sources })
    end,
}
