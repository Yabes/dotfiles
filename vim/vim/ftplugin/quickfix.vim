" Open file in quick fix with <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> :OpenQuickFixFile<cr>

function! OpenQuickFixFile()
  call cursor(0, 1)
  let line=split(expand("<cWORD>"), "|")
  wincmd k
  execute "e +".line[1]." ".line[0]
endfunction
command! -nargs=* OpenQuickFixFile call OpenQuickFixFile(<f-args>)

