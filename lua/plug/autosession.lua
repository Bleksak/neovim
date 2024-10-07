local autosession_path = vim.fn.stdpath("data") .. "/sessions/"

local autosave = true

local cwd = vim.loop.cwd()
local luacache = (_G.__luacache or {}).cache

local unload_from_cache = function(pkg)
    package.loaded[pkg] = nil
    if luacache then
        luacache[pkg] = nil
    end
end

local reload_config = function()
    -- vim.lsp.stop_client(vim.lsp.get_clients(), true)

    -- for pkg, _ in pairs(package.loaded) do
    --     if pkg:match("^plug.+") and pkg ~= "plug.autosession" then
    --         unload_from_cache(pkg)
    --     end
    -- end

    -- vim.cmd("source " .. vim.env.MYVIMRC)
    -- dofile(vim.env.MYVIMRC)
    -- vim.notify("Config reloaded!", vim.log.levels.INFO)
end

local hex_to_char = function(x)
    return string.char(tonumber(x, 16))
end

local percent_decode = function(str)
    if str == nil then
        return ""
    end
    return (str:gsub("%%(%x%x)", hex_to_char))
end

local escape_string_for_vim = function(str)
    return (str:gsub("%%", "\\%%"))
end

local char_to_hex = function(c)
    return string.format("%%%02X", string.byte(c))
end

local percent_encode = function(str)
    if str == nil then
        return ""
    end
    str = str:gsub("\n", "\r\n")

    -- Have to encode path separators for both unix and windows. also
    -- encode the invalid windows characters and a few others for portabiltiy
    -- This also works correctly with unicode characters (i.e. they are
    -- not encoded)
    return (str:gsub("([/\\:*?\"'<>+ |%.%%])", char_to_hex))
end

local save_session = function()
    if vim.fn.isdirectory(autosession_path) == 0 then
        vim.fn.mkdir(autosession_path, "p")
    end

    local session_name = percent_encode(cwd)
    local file_path = autosession_path .. session_name .. ".vim"

    vim.cmd("mks! " .. escape_string_for_vim(file_path))
end

local load_session = function(session)
    if session == nil then
        return
    end

    local file_path = autosession_path .. session

    if vim.fn.filereadable(file_path) == 0 then
        return
    end

    local session_folder = percent_decode(vim.fn.fnamemodify(session, ":r"))

    vim.cmd("%bw!")
    vim.cmd("clearjumps")
    vim.cmd("cd " .. escape_string_for_vim(session_folder))
    cwd = session_folder
    vim.cmd("source " .. escape_string_for_vim(file_path))
    reload_config()
end

vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    callback = function()
        if autosave then
            save_session()
        end
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    nested = true,
    callback = function()
        cwd = vim.loop.cwd()
        if #vim.fn.argv() > 0 then
            -- neovim was opened with file(s)
            autosave = false
            return
        end

        local session = percent_encode(cwd) .. ".vim"
        load_session(session)
    end,
})

vim.keymap.set("n", "<leader>ss", function()
    save_session()
end, { desc = "Save Session" })
vim.keymap.set("n", "<leader>fs", function()
    local session_list = vim.fn.readdir(autosession_path)
    vim.ui.select(session_list, {
        prompt = "Select Session",
        format_item = function(session)
            return vim.fn.fnamemodify(percent_decode(session), ":r")
        end,
    }, function(item)
        save_session()
        load_session(item)
    end)
end, { desc = "Find Session" })

vim.keymap.set("n", "<leader>ss", function()
    autosave = not autosave

    if autosave then
        vim.notify("Auto session enabled")
    else
        vim.notify("Auto session disabled")
    end
end, { desc = "Toggle auto save" })

vim.keymap.set("n", "<leader>sx", function()
    -- find the current session and delete it
    local session = percent_encode(cwd) .. ".vim"
    if vim.fn.filereadable(autosession_path .. session) == 0 then
        return
    end

    vim.fn.delete(autosession_path .. session)
    autosave = false
    vim.notify("Session deleted, auto session disabled")
end, { desc = "Delete Session" })
