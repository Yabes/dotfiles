if exists('g:loaded_mytexplugin')
  finish
endif
let g:loaded_mytexplugin = 1

function! WrapLines()
  set wrap
  set linebreak
endfunction

" https://vi.stackexchange.com/questions/8056/for-an-autocmd-in-a-ftplugin-should-i-use-pattern-matching-or-buffer
augroup texAutocmdsBuffer
  autocmd! * <buffer>
  autocmd FileType tex call WrapLines()
augroup END
