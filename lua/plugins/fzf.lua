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
                "fzf-native",

                winopts = {
                    fullscreen = true,
                    border = "thicc",
                    preview = {
                        border = "noborder",
                    }
                },

                keymap = {
                    -- Below are the default binds, setting any value in these tables will override
                    -- the defaults, to inherit from the defaults change [1] from `false` to `true`
                    builtin = {
                        false, -- do not inherit from defaults
                        -- neovim `:tmap` mappings for the fzf win
                        ["<F1>"]     = "toggle-help",
                        ["<F2>"]     = "toggle-fullscreen",
                        -- Only valid with the 'builtin' previewer
                        ["<F3>"]     = "toggle-preview-wrap",
                        ["<F4>"]     = "toggle-preview",
                        -- Rotate preview clockwise/counter-clockwise
                        ["<F5>"]     = "toggle-preview-ccw",
                        ["<F6>"]     = "toggle-preview-cw",
                        ["<S-down>"] = "preview-page-down",
                        ["<S-up>"]   = "preview-page-up",
                        ["<S-left>"] = "preview-page-reset",
                    },
                    fzf = {
                        false, -- do not inherit from defaults
                        -- fzf '--bind=' options
                        ["ctrl-z"]     = "abort",
                        ["ctrl-c"]     = "unix-line-discard",
                        ["ctrl-d"]     = "half-page-down",
                        ["ctrl-u"]     = "half-page-up",
                        ["ctrl-a"]     = "beginning-of-line",
                        ["ctrl-e"]     = "end-of-line",
                        ["alt-a"]      = "toggle-all",
                        -- Only valid with fzf previewers (bat/cat/git/etc)
                        ["f3"]         = "toggle-preview-wrap",
                        ["f4"]         = "toggle-preview",
                        ["shift-down"] = "preview-page-down",
                        ["shift-up"]   = "preview-page-up",
                    },
                },

                previewers = {
                    bat = {
                        -- theme = "Twodark",
                    },
                    viu = {}
                },

                fzf_opts = {
                    ["--ansi"]           = true,
                    ["--info"]           = "inline-right",
                    ["--height"]         = "100%",
                    ["--layout"]         = "reverse",
                    ["--border"]         = "none",
                    ["--highlight-line"] = true,
                },

                actions = {
                    files = {
                        ["default"] = require("fzf-lua.actions").file_edit,
                        ["ctrl-s"] = require("fzf-lua.actions").file_split,
                        ["ctrl-v"] = require("fzf-lua.actions").file_vsplit,
                        ["ctrl-t"] = require("fzf-lua.actions").file_tabedit,
                        ["alt-q"] = require("fzf-lua.actions").file_sel_to_qf,
                    },
                },
                lsp = {
                    async_or_timeout = true,
                    code_actions = {
                        previewer = 'codeaction'
                        -- previewer = 'codeaction_native',
                        -- preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
                    },
                    -- symbols = {
                    --     symbol_icons = icons.symbol_kinds,
                    -- },
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
            { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>",                                   desc = "Files" },
            { "<leader> ",  "<cmd>lua require('fzf-lua').files()<CR>",                                   desc = "Files" },
            { "<leader>/",  "<cmd>lua require('fzf-lua').grep_project()<CR>",                            desc = "Grep project" },
            { "<leader>f/", "<cmd>lua require('fzf-lua').grep_project()<CR>",                            desc = "Grep project" },
            { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>",                                 desc = "Buffers" },
            { "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>",                               desc = "Help tags" },
            { "<leader>fw", "<cmd>lua require('fzf-lua').grep_cWORD()<CR>",                              desc = "Grep word under cursor", mode = "n" },
            { "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>",                                  desc = "Fzf resume" },
            { "<leader>fc", "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<CR>", desc = "Find config file" },
        }
    },
}
