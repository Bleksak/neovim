return {
    "aznhe21/actions-preview.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
    local actions = require("actions-preview")
    actions.setup({
        telescope = {
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.8,
                height = 0.9,
                prompt_position = "top",
                preview_cutoff = 20,
                preview_height = function(_, _, max_lines)
                    return max_lines - 15
                end,
            },
        },
    })

    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>ca", require("actions-preview").code_actions }
    end,
}
