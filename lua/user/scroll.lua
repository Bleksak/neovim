require('neoscroll').setup({
  mappings = {
    '<C-u>', '<C-d>', '<C-b>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
  },
  hide_cursor = true,
  stop_eof = true,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  performance_mode = true
})
