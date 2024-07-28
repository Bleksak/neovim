return {
    {
        "Janiczek/vim-latte"
    },
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts = vim.tbl_deep_extend("force", opts, {
                servers = {
                    emmet_language_server = {
                        filetypes = { "latte.php.html" },
                    },
                    html = {
                        filetypes = { "latte.php.html" },
                    },
                }
            })

            return opts
        end,
    },
}
