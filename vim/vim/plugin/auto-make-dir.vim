if exists('g:loaded_automakedir') | finish | endif " prevent loading file twice
let g:loaded_automakedir = 1

fun! <SID>AutoMakeDirectory()
  let s:directory = expand('<afile>:p:h')

  if !isdirectory(s:directory)
    call mkdir(s:directory, 'p')
  endif

endfun
autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()
