if exists('g:loaded_myjsplugin')
  finish
endif
let g:loaded_myjsplugin = 1

setlocal nocindent

let b:ale_linters = ['prettier-eslint']
