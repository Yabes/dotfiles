""""""""""""""""""""""""""""""
" @author Matthis LC
""""""""""""""""""""""""""""""

" Lang settings
set spelllang=en,fr
set spell

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions=

" Number display
set number
set relativenumber

" Hide mode, replaced by airline
set noshowmode

" No wrap words
set nowrap

" Disable Syntax Highlighting after 500 char
set synmaxcol=500

" Patched font with icon
if has("unix")
  if has("macunix")
    set guifont=FiraCode-Regular:h11

    if has("gui_running")
      set macligatures
    endif
  else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  endif
endif

" unified theme
colorscheme flatcolor
set background=dark

" Timeout
set ttimeout
set ttimeoutlen=100

set cursorline

" Config Split
set splitright
set splitbelow

" Set gf suffix
set suffixesadd+=.js

" Insert blank line in normal mode with <CR>
" nmap <CR> o<Esc>

" Always search in very-magic mode
nnoremap / /\v

" Date shortcut
imap <Leader>dly <C-R>=strftime("%d %b %y")<CR>
imap <Leader>dmy <C-R>=strftime("%d/%m/%y")<CR>
imap <Leader>hm  <C-R>=strftime("%R")<CR>

" Remove whitespace on save
autocmd FileType c,cpp,python,ruby,java,javascript,php,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" Get recent commit message
function! InsertLatestCommitMessage(...)
    let numberOfLine = a:0 > 0 ? a:1 : 1
    let decorator  = a:0 > 1 ? a:2 : '*'
    execute 'read !git log --pretty=format:"' . decorator . ' \%s (\%h)" --date=short -n ' . numberOfLine
endfunction
command! -nargs=* InsertLatestCommitMessage call InsertLatestCommitMessage(<f-args>)

function! OpenQuickFixFile()
    call cursor(0, 1)
    let line=split(expand("<cWORD>"), "|")
    wincmd k
    execute "e +".line[1]." ".line[0]
endfunction
command! -nargs=* OpenQuickFixFile call OpenQuickFixFile(<f-args>)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> :OpenQuickFixFile<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/config.vim<cr>
autocmd! bufwritepost *.vim source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor-like shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move line up/down
noremap <silent> <C-Up> Vdkkp
noremap <silent> <C-Down> Vdp

" New tab
noremap <silent> <C-t> :tabnew<CR>

" Copy/Cut/Paste
noremap <silent> <leader>c "+y

noremap <silent> <leader>x "+x

noremap <silent> <leader>v "+p
noremap <silent> <leader>V "+P

" Move to next/prev Tab page
noremap <silent> <C-Left> :tabp<CR>
noremap <silent> <C-Right> :tabn<CR>

nnoremap <silent> <ESC><ESC> :noh<CR>

" Execute macro over visual range
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Press \r to start rotating lines and <C-c> (Control+c) to stop.

function! s:RotateString(string)
    let split_string = split(a:string, '\zs')
    return join(split_string[-1:] + split_string[:-2], '')
endfunction

function! s:RotateLine(line, leading_whitespace, trailing_whitespace)
    return substitute(
        \ a:line,
        \ '^\(' . a:leading_whitespace . '\)\(.\{-}\)\(' . a:trailing_whitespace . '\)$',
        \ '\=submatch(1) . <SID>RotateString(submatch(2)) . submatch(3)',
        \ ''
    \ )
endfunction

function! s:RotateLines()
    let saved_view = winsaveview()
    let first_visible_line = line('w0')
    let last_visible_line = line('w$')
    let lines = getline(first_visible_line, last_visible_line)
    let leading_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''^\s*'')'
    \ )
    let trailing_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''\s*$'')'
    \ )
    try
        while 1 " <C-c> to exit
            let lines = map(
                \ range(len(lines)),
                \ '<SID>RotateLine(lines[v:val], leading_whitespace[v:val], trailing_whitespace[v:val])'
            \ )
            call setline(first_visible_line, lines)
            redraw
            sleep 50m
        endwhile
    finally
        if &modified
            silent undo
        endif
        call winrestview(saved_view)
    endtry
endfunction

nnoremap <silent> <Plug>(RotateLines) :<C-u>call <SID>RotateLines()<CR>

nmap \r <Plug>(RotateLines)
