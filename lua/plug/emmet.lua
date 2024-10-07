vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = { "html", "blade", "latte", "css", "eruby", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "typescriptreact", "htmlangular" },
        callback = function(opts)
            vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation,
                { desc = "Emmet expand with abbreviation" })
        end
    }
)
