local mpd = require("mpd")

mpd.setup({
    host = "127.0.0.1",
    port = "6600",
    sink_name = 'PipeWire ALSA [mpd]',
})

vim.keymap.set("n", "<leader>ma", "<cmd>lua require('mpd').actions()<cr>", { desc = "MPD Actions" })
vim.keymap.set("n", "<leader>mn", "<cmd>lua require('mpd').next()<cr>", { desc = "MPD Next" })
vim.keymap.set("n", "<leader>mp", "<cmd>lua require('mpd').prev()<cr>", { desc = "MPD Previous" })
vim.keymap.set("n", "<leader>mf" , "<cmd>lua require('mpd').find_song()<cr>", { desc = "MPD Find Song" })
vim.keymap.set("n", "<leader>m/", "<cmd>lua require('mpd').find_album()<cr>", { desc = "MPD Find Album" })
vim.keymap.set("n", "<leader>m<leader>", "<cmd>lua require('mpd').toggle()<cr>", { desc = "MPD Play/Pause" })
vim.keymap.set("n", "<leader>mx", "<cmd>lua require('mpd').shuffle()<cr>", { desc = "MPD Shuffle" })
vim.keymap.set("n", "<leader>mv", "<cmd>lua require('mpd').set_volume()<cr>", { desc = "MPD Set Volume" })
