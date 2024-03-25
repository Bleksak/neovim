return {
    dir = "~/dev/diffthis",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        keys = {
            mode = "<leader>dd",
            left = "do",
            right = "dp",
        },
    },
}
