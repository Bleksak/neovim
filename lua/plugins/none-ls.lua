return {
    "nvimtools/none-ls.nvim",

    event = { "BufReadPre", "BufNewFile" },

    opts = function(_, opts)
        local nls = require("null-ls")

        return vim.tbl_deep_extend("force", opts, {
            sources = {
                nls.builtins.formatting.stylua,
                nls.builtins.formatting.prettier,
                nls.builtins.formatting.prettierd,
            },
        })
    end,
}
