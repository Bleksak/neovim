return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "VeryLazy" },
        cmd = { "TSInstall", "TSInstallInfo", "TSInstallSync", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "php",
                "javascript",
                "typescript",
                "tsx",
                "php",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "yaml",
                "vim",
                "svelte",
                "css",
                "scss",
                "c",
                "cpp",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },

            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
                    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
                    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
                    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
                },
            },
        },

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            local parsers = require("nvim-treesitter.parsers").get_parser_configs()

            ---@diagnostic disable-next-line: inject-field
            parsers.neon = {
                install_info = {
                    url = "~/dev/ts-neon",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                    files = { "src/parser.c", "src/scanner.c" },
                },
                filetype = "neon",
            }

            ---@diagnostic disable-next-line: inject-field
            parsers.blade = {
                install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = {"src/parser.c"},
                branch = "main",
              },
              filetype = "blade"
            }

        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
}
