if exists('g:loaded_mymakefileplugin')
  finish
endif
let g:loaded_mymakefileplugin = 1

" https://vi.stackexchange.com/questions/8056/for-an-autocmd-in-a-ftplugin-should-i-use-pattern-matching-or-buffer
augroup makefileAutocmdsBuffer
  autocmd! * <buffer>
  autocmd BufRead,BufNewFile Makefile set noet
augroup END
