return {
	"folke/which-key.nvim",

    event = "VeryLazy",

    opts = {
        preset = "helix",
        delay = 0,
        spec = {
            mode = { "n", "v" },
            {"g", group = "goto"},
            {"]", group = "next"},
            {"[", group = "prev" },
            -- {"<leader><tab>" = { group = "tabs" },
            {"<leader>b", group = "buffer" },
            {"<leader>c", group = "code" },
            {"<leader>f", group = "file/find" },
            -- ["<leader>g"], group = "+git" },
            {"<leader>gh", group = "hunks" },
            {"<leader>m", group = "music" },
            -- {"<leader>l", group = "lsp" },
            -- {"<leader>q", group = "quit/session" },
            -- {"<leader>s", group = "search" },
            -- {"<leader>t", group = "testing" },
            -- {"<leader>u", group = "ui" },
            {"<leader>w", group = "windows" },
            {"<leader>x", group = "delete" },
        },
    },
    -- keys = {
    --     { "<C-h>", "<cmd>wincmd h<cr>", desc = "Move to the left window" },
    --     { "<C-j>", "<cmd>wincmd j<cr>", desc = "Move to the bottom window" },
    --     { "<C-k>", "<cmd>wincmd k<cr>", desc = "Move to the top window" },
    --     { "<C-l>", "<cmd>wincmd l<cr>", desc = "Move to the right window" },
    -- },
}
