if exists('g:loaded_myreasonplugin')
  finish
endif
let g:loaded_myreasonplugin = 1

setlocal formatprg=refmt

" https://vi.stackexchange.com/questions/8056/for-an-autocmd-in-a-ftplugin-should-i-use-pattern-matching-or-buffer
augroup reasonAutocmdsBuffer
  autocmd! * <buffer>
  autocmd BufWritePre *.re Neoformat
augroup END
