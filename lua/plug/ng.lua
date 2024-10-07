local ng = require('ng')

vim.keymap.set(
    'n',
    '<leader>at',
    ng.goto_template_for_component,
    { desc = 'Goto template for component', noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    '<leader>ac',
    ng.goto_component_with_template_file,
    { desc = 'Goto component with template file', noremap = true, silent = true }
)

vim.keymap.set('n', '<leader>aT', ng.get_template_tcb, { desc = 'Get template TCB', noremap = true, silent = true })
