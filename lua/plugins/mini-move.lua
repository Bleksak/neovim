return {
    "echasnovski/mini.move",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
        mapping = {
            left = "<",
            right = ">",
            down = "<M-j>",
            up = "<M-k>",

            line_left = "<",
            line_right = ">",
            line_down = "<M-j>",
            line_up = "<M-k>",
        },
    },
}
