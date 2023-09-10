vim.g.material_style = "palenight"

vim.cmd 'colorscheme material'

require('material').setup({
  plugins = {
    "indent-blankline",
    "nvim-cmp",
    "nvim-tree",
    "nvim-web-devicons",
    "telescope",
    "which-key",
  },
  
  async_loading = true,
  lualine_style = "default",
})

-- vim.cmd('highlight BufferLineFill guifg=#0 guibg=#0 gui=bold')
-- vim.cmd('highlight BufferLineBackground guifg=#0 guibg=#0 gui=bold')
-- vim.cmd('highlight BufferLineCloseButton guifg=#0 guibg=#0 gui=bold')
