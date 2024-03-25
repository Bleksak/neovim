return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
    },
    {
        "ibhagwan/fzf-lua",
        event = "VeryLazy",

        opts = function(_, opts)
            opts = vim.tbl_deep_extend("force", opts, {
                "max-perf",

                actions = {
                    files = {
                        ["default"] = require("fzf-lua.actions").file_edit,
                        ["ctrl-s"] = require("fzf-lua.actions").file_split,
                        ["ctrl-v"] = require("fzf-lua.actions").file_vsplit,
                        ["ctrl-t"] = require("fzf-lua.actions").file_tabedit,
                        ["alt-q"] = require("fzf-lua.actions").file_sel_to_qf,
                    },
                },
            })

            return opts
        end,

        config = function(_, opts)
            local fzf = require("fzf-lua")
            fzf.setup(opts)

            fzf.register_ui_select()
        end,
        keys = {
            { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>",      desc = "Files" },
            { "<leader>/",  "<cmd>lua require('fzf-lua').grep_project()<CR>",  desc = "Grep project" },
            { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>",    desc = "Buffers" },
            { "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>",  desc = "Help tags" },
            { "<leader>fw", "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", desc = "Grep word under cursor", mode = "n" },
            { "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>",     desc = "Fzf resume" },
            { "<leader>fc", "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<CR>", desc = "Find config file" },
        }
    },
}
