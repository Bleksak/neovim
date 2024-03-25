return {
    "akinsho/bufferline.nvim",
    event = { "BufReadPre", "BufWritePost", "BufNewFile" },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            custom_filter = function(buf_number, buf_numbers)
                if
                    vim.bo[buf_number].buftype == "terminal"
                    or vim.bo[buf_number].buftype == "quickfix"
                    or vim.bo[buf_number].buftype == "help"
                    or vim.bo[buf_number].buftype == "wiki"
                then
                    return false
                end

                return true
            end,
        },
    },

    keys = {
        { "<leader>bd", "<cmd>bdelete!<cr>",            desc = "Delete buffer" },
        { "L",          "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "H",          "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    },
}
