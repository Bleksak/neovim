-- vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

require("lsp")

-- local client = vim.lsp.start_client({
--     name = "phplsp",
--     cmd = { "/home/bleksak/dev/phplsp/target/debug/phplsp" },
--     root_dir = vim.fs.dirname(vim.fs.find({ "composer.json", }, { upward = true })[1]),
--     settings = {},
--     on_attach = {},
-- })
--
-- if not client then
--     vim.notify("bad client setup")
-- else
--     vim.api.nvim_create_autocmd("FileType", {
--         pattern = { "php" },
--         callback = function(ev)
--             vim.lsp.buf_attach_client(0, client)
--         end
--     })
-- end
