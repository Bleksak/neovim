return {
    {
        enabled = false,
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },

        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    prefix = "●",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                },
            },

            servers = {
                rust_analyzer = {},
                -- phpactor = {},
                lua_ls = {},
                emmet_language_server = {},
                tsserver = {
                    settings = {
                        implicitProjectConfiguration = { checkJs = true },
                    },
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
                cssls = {},
                jsonls = {},
                html = {
                    init_options = {
                        provideFormatter = false,
                    }
                },
                -- blade_formatter = {},
                -- htmldjango = {},
                -- prettier = {},
                -- prettierd = {},
                svelte = {},
                yamlls = {},
                ruff_lsp = {},
                -- pretty_php = {},
                -- sqlls = {
                --     filetypes = { 'sql' },
                --     root_dir = function(_) return vim.loop.cwd() end,
                -- }
            },
            setup = {
                tsserver = function()
                    require("lspconfig")["tsserver"].setup({
                        capabilities = vim.lsp.protocol.make_client_capabilities(),
                        on_attach = function(client, bufnr)
                            client.resolved_capabilities.document_formatting = false
                        end
                    })
                end,
            },
        },

        keys = {
            { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>",                 desc = "Rename" },
            { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",             desc = "Go to definition" },
            { "gr",         "<cmd>lua require('fzf-lua').lsp_references()<cr>",             desc = "Find references" },
            { "gi",         "<cmd>lua require('fzf-lua').lsp_implementations()<CR>",         desc = "Find implementation" },
            { "K",          "<cmd>lua vim.lsp.buf.hover()<cr>",                  desc = "Hover" },
            { "[d",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",           desc = "Previous diagnostic" },
            { "]d",         "<cmd>lua vim.diagnostic.goto_next()<cr>",           desc = "Next diagnostic" },
            -- { "<leader>cd", "<cmd>lua vim.diagnostic.setloclist()<cr>",          desc = "Diagnostics list" },
            -- { "<leader>cD", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Diagnostics list" },
            { "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format buffer" },
            -- { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code actions" },
            { "<leader>ca", "<cmd>lua require('fzf-lua').lsp_code_actions({winopts = { preview = { layout = 'vertical' } }})<CR>", desc = "Code actions" },
            { "<leader>cd", "<cmd>lua require('fzf-lua').lsp_document_diagnostics({winopts = { preview = { layout = 'vertical' } }})<CR>", desc = "Document diagnostics" },
            { "<leader>cD", "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({winopts = { preview = { layout = 'vertical' } }})<CR>", desc = "Workspace diagnostics" },
        },

        config = function() end

    --     config = function(_, opts)
    --         -- NOTE: this disables logging, comment out to enable it again
    --         -- vim.lsp.set_log_level("off")
    --
    --         local mlsp = require("mason-lspconfig")
    --         local servers = opts.servers
    --         local capabilities =
    --             vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), opts.capabilities or {})
    --
    --         local function setup(server)
    --             local server_opts = vim.tbl_deep_extend("force", {
    --                 capabilities = vim.deepcopy(capabilities),
    --             }, servers[server] or {})
    --
    --             if opts.setup[server] then
    --                 if opts.setup[server](server, server_opts) then
    --                     return
    --                 end
    --             end
    --
    --             if opts.setup["*"] then
    --                 if opts.setup["*"](server, server_opts) then
    --                     return
    --                 end
    --             end
    --
    --             local default_filetypes = require("lspconfig")[server].document_config.default_config.filetypes
    --             server_opts.filetypes = vim.list_extend(default_filetypes, server_opts.filetypes or {})
    --             if server_opts.on_attach == nil then
    --                 server_opts.on_attach = function(client, bufnr)
    --                 end
    --             end
    --
    --             require("lspconfig")[server].setup(server_opts)
    --         end
    --
    --         local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    --         local ensure_installed = {}
    --
    --         for server, server_opts in pairs(servers) do
    --             if server_opts then
    --                 server_opts = server_opts == true and {} or server_opts
    --                 -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
    --                 if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
    --                     setup(server)
    --                 else
    --                     ensure_installed[#ensure_installed + 1] = server
    --                 end
    --             end
    --         end
    --
    --         mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    --     end,
    },
}
