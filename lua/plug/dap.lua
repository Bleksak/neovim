
local dap = require("dap")
dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
        host = "127.0.0.1",
    },
}

require("nvim-dap-virtual-text").setup({})
require("dapui").setup()


vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set breakpoint condition" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step out" })

vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "Evaluate expression" })
vim.keymap.set("n", "<leader>dt", function() require("dapui").toggle() end, { desc = "Toggle UI" })
