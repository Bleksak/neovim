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
            window = {
                mappings = {
                    
                }
            }
        },

        keys = {
            { "<leader>e", "<cmd>Neotree toggle float<cr>", desc = "Toggle Explorer" },
            { "<leader>E", "<cmd>Neotree toggle float reveal<cr>", desc = "Toggle Explorer with file reveal" },
        }
    }
}
