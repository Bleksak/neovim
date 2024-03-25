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
                auto_setup = true,
            },

            mappings = {
                force_twostep = "<C-Space>",  -- Force two-step completion
                force_fallback = "<A-Space>", -- Force fallback completion
            },

            set_vim_settings = true,
        },

        keys = {
            { "<Tab>",   "pumvisible() ? '<C-n>' : '<Tab>'",   expr = true, mode = "i" },
            { "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", expr = true, mode = "i" },
        },
    },
}
