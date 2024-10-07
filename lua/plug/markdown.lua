require("render-markdown").setup {
    latex = {
        enabled = false,
    },
}

-- main = "render-markdown", TODO: I dont know what this means
--

-- Nabla setup
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md" },
    callback = function(ev)
        require("nabla").enable_virt({
            autogen = true, -- auto-regenerate ASCII art when exiting insert mode
            silent = true,  -- silents error messages
        })

        vim.keymap.set("n", "<leader>np", function() require("nabla").popup() end, { desc = "Nabla popup", buffer = ev.buf } )
    end
})

