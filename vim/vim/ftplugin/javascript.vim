if exists('g:loaded_myjsplugin')
  finish
endif
let g:loaded_myjsplugin = 1

setlocal nocindent
" setlocal formatprg=prettier\ --stdin\ --single-quote\ --print-width\ 120\ --parser\ babylon

" let b:ale_linters = ['prettier-eslint']

" https://vi.stackexchange.com/questions/8056/for-an-autocmd-in-a-ftplugin-should-i-use-pattern-matching-or-buffer
" augroup jsAutocmdsBuffer
"   autocmd! * <buffer>
"   autocmd BufWritePre <buffer> CocCommand prettier.formatFile
" augroup END

