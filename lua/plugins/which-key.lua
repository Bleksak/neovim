return {
	"folke/which-key.nvim",
	opts = {},

    event = "VeryLazy",

    config = function(_, opts)
        require("which-key").setup(opts)
        vim.o.timeout = true
        vim.o.timeoutlen = 0
    end,

    keys = {
        { "<C-h>", "<cmd>wincmd h<cr>", desc = "Move to the left window" },
        { "<C-j>", "<cmd>wincmd j<cr>", desc = "Move to the bottom window" },
        { "<C-k>", "<cmd>wincmd k<cr>", desc = "Move to the top window" },
        { "<C-l>", "<cmd>wincmd l<cr>", desc = "Move to the right window" },
    },
}
