return {
    -- enabled = false,
    "jbyuki/nabla.nvim",
    ft = "markdown",
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = { "*.md" },
            callback = function()
                require("nabla").enable_virt({
                    autogen = true, -- auto-regenerate ASCII art when exiting insert mode
                    silent = true,  -- silents error messages
                })
            end
        })
    end,
    keys = {
        { "<leader>np", function() require("nabla").popup() end, desc = "Nabla popup" },
    }
}
