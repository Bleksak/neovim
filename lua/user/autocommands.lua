vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup phpjsfix
    autocmd!
    autocmd FileType javascript setlocal iskeyword+=$
    autocmd FileType php setlocal iskeyword-=$
    autocmd FileType php setlocal iskeyword-=-
  augroup END

  augroup BladeFiltypeRelated
    au BufNewFile,BufRead *.blade.php set ft=blade
  augroup END

  augroup LatteFiltypeRelated
    au BufNewFile,BufRead *.latte set ft=latte
  augroup END
]]

