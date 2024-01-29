return {
    "Exafunction/codeium.vim",
    commit = "a1c3d6b369a18514d656dac149de807becacbdf7",
    event = "BufEnter",
    config = function()
        vim.keymap.set("i", "<C-g>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<A-[>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<A-]>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true })

        vim.keymap.set("i", "<C-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true })

        vim.g.codeium_no_map_tab = true
    end,
}
