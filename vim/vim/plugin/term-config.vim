if exists('g:loadedtermconfig') | finish | endif " prevent loading file twice
let g:loadedtermconfig = 1

augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
