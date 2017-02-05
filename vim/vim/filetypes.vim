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
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript set suffixesadd+=.js

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

au BufNewFile,BufRead .eslintrc set ft=json

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Typescript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType typescript set suffixesadd+=.ts

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
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoreload .vim files
autocmd! bufwritepost *.vim source ~/.vimrc
" Open file in quick fix with <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> :OpenQuickFixFile<cr>

function! OpenQuickFixFile()
  call cursor(0, 1)
  let line=split(expand("<cWORD>"), "|")
  wincmd k
  execute "e +".line[1]." ".line[0]
endfunction
command! -nargs=* OpenQuickFixFile call OpenQuickFixFile(<f-args>)

autocmd BufNewFile,BufRead cheat40* set filetype=cheat40
