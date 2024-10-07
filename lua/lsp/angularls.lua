local capabilities = vim.lsp.protocol.make_client_capabilities()
local project_library_path = './node_modules'
local util = require('lspconfig.util')

local cmd =
    { 'ngserver', '--stdio', '--tsProbeLocations', project_library_path, '--ngProbeLocations', project_library_path }

require('lspconfig').angularls.setup({
    capabilities = capabilities,
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
    root_dir = util.root_pattern('angular.json', 'project.json'),
})

require('lspconfig').nxls.setup({
    capabilities = capabilities,
})
