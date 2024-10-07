local opts = {
    ensure_installed = {
        "bash",
        "fish",
        "html",
        "php",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "php_only",
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
        "rust",
        "neon",
        "blade",
        "latex",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
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
}

local parsers = require("nvim-treesitter.parsers").get_parser_configs()

---@diagnostic disable-next-line: inject-field
parsers.neon = {
    install_info = {
        url = "file:///home/bleksak/dev/ts-neon",
        generate_requires_npm = true,
        requires_generate_from_grammar = true,
        files = { "src/parser.c", "src/scanner.c" },
    },
    filetype = "neon",
}

---@diagnostic disable-next-line: inject-field
parsers.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade",
}

require("nvim-treesitter.configs").setup(opts)
