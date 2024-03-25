return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        -- event = "BufEnter",
        cmd = "Neotree",
        lazy = true,

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "antosha417/nvim-lsp-file-operations",
        },
        opts = {
        },

        keys = {
            { "<leader>e", "<cmd>Neotree float<cr>", desc = "Toggle Explorer" },
        }
    }
}
