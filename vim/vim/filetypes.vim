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

augroup jsSyntax
  autocmd!
  autocmd FileType javascript setl nocindent
  autocmd FileType javascript set suffixesadd+=.js
  autocmd FileType javascript.jsx set suffixesadd+=.jsx
  autocmd FileType javascript setl formatprg=prettier\ --stdin\ --single-quote\ --print-width\ 120
  autocmd FileType javascript.jsx setl formatprg=prettier\ --stdin\ --single-quote\ --print-width\ 120
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufNewFile,BufRead .eslintrc set ft=json
augroup END

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WrapLines()
  set wrap
  set linebreak
endfunction

augroup texSyntaxOverride
  autocmd!
  autocmd FileType tex call WrapLines()
augroup END

augroup tex
  autocmd!
  " autocmd FileType tex let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWIki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimwikiSyntaxOverrid
  autocmd!
  autocmd FileType vimwiki call WrapLines()
augroup END

