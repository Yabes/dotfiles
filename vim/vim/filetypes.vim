""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => HTML section
"""""""""""""""""""""""""""""""
" Conceal HTML entities
syntax match Entity "&amp;" conceal cchar=&
syntax match Entity "&lt;" conceal cchar=<
syntax match Entity "&gt;" conceal cchar=>
syntax match Entity "&copy;" conceal cchar=©
"set ambiwidth=double

""""""""""""""""""""""""""""""
" => Markdown section
"""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


""""""""""""""""""""""""""""""
" => CSS section
"""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
autocmd BufRead,BufNewFile *.css,*.scss,*.less ColorHighlight


""""""""""""""""""""""""""""""
" => PHP section
"""""""""""""""""""""""""""""""
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
