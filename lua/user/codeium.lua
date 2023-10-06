-- create an empty autocommand group
vim.cmd [[
  augroup codeium
    autocmd VimEnter * CodeiumAuto
  augroup end
]]
