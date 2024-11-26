if exists('g:loaded_automakedir') | finish | endif " prevent loading file twice
let g:loaded_automakedir = 1

fu! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction


fun! <SID>AutoMakeDirectory()
  let s:directory = expand('<afile>:p:h')

  if !isdirectory(s:directory) && !StartsWith(s:directory, 'oil:') && !StartsWith(s:directory, 'suda:')
    call mkdir(s:directory, 'p')
  endif

endfun
autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()
