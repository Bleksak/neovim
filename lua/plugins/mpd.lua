return {
    "paulfrische/mpd.nvim",
    opts = {
        host = "127.0.0.1",
        port = "6600"
    },
    keys = {
        { "<leader>ma", "<cmd>lua require('mpd').actions()<cr>", desc = "MPD Actions" },
        { "<leader>mn", "<cmd>lua require('mpd').next()<cr>", desc = "MPD Next" },
        { "<leader>mp", "<cmd>lua require('mpd').prev()<cr>", desc = "MPD Previous" },
        { "<leader>mf", "<cmd>lua require('mpd').find_song()<cr>", desc = "MPD Find Song" },
        { "<leader>m/", "<cmd>lua require('mpd').find_album()<cr>", desc = "MPD Find Album" },
        { "<leader>m<leader>", "<cmd>lua require('mpd').toggle()<cr>", desc = "MPD Play/Pause" },
        { "<leader>mx", "<cmd>lua require('mpd').shuffle()<cr>", desc = "MPD Pause" },
    }
}
