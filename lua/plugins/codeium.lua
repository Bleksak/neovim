return {
    "Exafunction/codeium.vim",
    event = {"BufReadPost", "BufNewFile"},

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local uname = vim.uv.os_uname()

        vim.g.codeium_no_map_tab = true
        vim.g.codeium_disable_bindings = true
        vim.g.codeium_idle_delay = 75

        vim.g.codeium_os = uname.sysname
        vim.g.codeium_arch = uname.machine
    end,

    keys = {
        { "<C-g>", function() return vim.fn["codeium#Accept"]() end, desc = "Codeium Accept Suggestion", mode = "i", expr = true, silent = true },
        { "<A-[>", function() return vim.fn["codeium#CycleCompletions"](1) end, desc = "Codeium Cycle Completions", mode = "i", silent = true },
        { "<A-]>", function() return vim.fn["codeium#CycleCompletions"](-1) end, desc = "Codeium Cycle Completions", mode = "i", silent = true },
        { "<C-c>", function() return vim.fn["codeium#Clear"]() end, desc = "Codeium Clear", mode = "i", silent = true },
        { "<leader>cx", function() return vim.fn["codeium#Chat"]() end, desc = "Codeium Chat" },
    }
}
