return {
    dir = "~/dev/laravel-ide-helper.nvim",
    enabled = function()
        return vim.fn.filereadable("artisan") ~= 0
    end,
    opts = {
        models_args = {"-N", "--reset", "-M"}
    },
    keys = {
        { "<leader>lgm", function() require("laravel-ide-helper").generate_models(vim.fn.expand("%")) end, desc = "Generate Model Info for current model" },
        { "<leader>lgM", function() require("laravel-ide-helper").generate_models() end, desc = "Generate Model Info for all models" },
    }
}
