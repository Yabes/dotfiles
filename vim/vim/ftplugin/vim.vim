if exists('g:loaded_myvimplugin')
  finish
endif
let g:loaded_myvimplugin = 1

let b:ale_linters = ['vint']

setlocal shiftwidth=2

" https://vi.stackexchange.com/questions/8056/for-an-autocmd-in-a-ftplugin-should-i-use-pattern-matching-or-buffer
augroup vimAutocmdsBuffer
  autocmd! * <buffer>
  autocmd! BufWritePost *.vim source ~/.config/nvim/init.lua
augroup END
