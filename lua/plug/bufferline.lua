local bufferline = require("bufferline")


bufferline.setup {
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
            -- vim.bo[buf_number].buftype == "terminal"
            if
                vim.bo[buf_number].buftype == "quickfix"
                or vim.bo[buf_number].buftype == "help"
                or vim.bo[buf_number].buftype == "wiki"
            then
                return false
            end

            return true
        end,
    },
}

vim.keymap.set("n", "L",          "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "H",          "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
