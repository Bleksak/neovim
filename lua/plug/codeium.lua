if false then
    local uname = vim.uv.os_uname()

    vim.g.codeium_no_map_tab = true
    vim.g.codeium_disable_bindings = true
    vim.g.codeium_idle_delay = 75

    vim.g.codeium_os = uname.sysname
    vim.g.codeium_arch = uname.machine

    vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<A-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<A-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<C-c>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    vim.keymap.set("i", "<leader>cx", function() return vim.fn["codeium#Chat"]() end, { expr = true })
else
    require("supermaven-nvim").setup({
        keymaps = {
            accept_suggestion = "<C-g>",
            clear_suggestion = "<C-c>",
            accept_word = "<C-w>",
        },
        ignore_filetypes = {},     -- or { "cpp", }
        color = {
            suggestion_color = "#ff0000",
            cterm = 244,
        },
        log_level = "info",                    -- set to "off" to disable logging completely
        disable_inline_completion = false,     -- disables inline completion for use with cmp
        disable_keymaps = false,                -- disables built in keymaps for more manual control
        condition = function()
            return false
        end     -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
    })
    -- require("neocodeium").setup()
    --
    -- vim.keymap.set("i", "<C-g>", function() require("neocodeium").accept() end, { expr = true, desc = "Codeium Accept Suggestion", silent = true })
    -- vim.keymap.set("i", "<A-[>", function() require("neocodeium").cycle_or_complete(-1) end, { expr = true, desc = "Codeium Cycle Completions", silent = true })
    -- vim.keymap.set("i", "<A-]>", function() require("neocodeium").cycle_or_complete(1) end, { expr = true, desc = "Codeium Cycle Completions", silent = true })
    -- vim.keymap.set("i", "<C-c>", function() require("neocodeium").clear() end, { expr = true, desc = "Codeium Clear", silent = true })
    -- { "<leader>cx", require("neocodeium").chat, desc = "Codeium Chat" },
end
