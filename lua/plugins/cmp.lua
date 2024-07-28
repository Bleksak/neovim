return {
    {
        "echasnovski/mini.completion",
        version = "*",
        enabled = true,

        event = "VeryLazy",

        -- @param MiniCompletion opts
        opts = {
            delay = {
                completion = 0,
                info = 0,
                signature = 0,
            },

            window = {
                info = {
                    height = 25,
                    width = 80,
                    border = "rounded",
                },

                signature = {
                    height = 25,
                    width = 80,
                    border = "rounded",
                },
            },

            lsp_completion = {
                source_func = "omnifunc", -- or completefunc
                auto_setup = false,
            },

            mappings = {
                force_twostep = "<C-Space>",  -- Force two-step completion
                force_fallback = "<A-Space>", -- Force fallback completion
            },

            set_vim_settings = true,
        },

        keys = {
            { "<C-j>",   "pumvisible() ? '<C-n>' : '<C-j>'",   expr = true, mode = "i" },
            { "<C-k>", "pumvisible() ? '<C-p>' : '<C-k>'", expr = true, mode = "i" },
        },
    },
}
