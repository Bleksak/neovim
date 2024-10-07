require("todo-comments").setup({})

vim.keymap.set("n", "<leader>ft", function()
    require("todo-comments.search").search(function(results)
        vim.ui.select(results, {
            prompt = "Todo comments",
            format_item = function(item)
                return item.text .. " (" .. item.filename .. " " .. item.lnum .. ":" .. item.col .. ")"
            end,
        }, function(item)
            if not item then
                return
            end
            vim.cmd("edit +" .. item.lnum .. " " .. item.filename)
            vim.cmd("normal " .. item.col .. "|")
        end)
    end)
end, { desc = "Find todo comments" })
