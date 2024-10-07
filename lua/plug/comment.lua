require("ts_context_commentstring").setup {
    enable_autocmd = false,
}

require("mini.comment").setup {
    options = {
        custom_commentstring = function()
            -- we disable this for rust, because it screws with maud html! macro
            if vim.bo.filetype == "rust" then
                return vim.bo.commentstring
            end

            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end
    },
}
