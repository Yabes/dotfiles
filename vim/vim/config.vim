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
    set macligatures
    set guifont=FiraCode-Regular:h11
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/config.vim<cr>
autocmd! bufwritepost *.vim source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor-like shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move line up/down
map <silent> <C-Up> Vdkkp
map <silent> <C-Down> Vdp

" Delete buffer
" map <silent> <C-w> :bd<CR>
map <silent> <S-w> :bd<CR>
" New tab
map <silent> <C-t> :tabnew<CR>
" Save
map <silent> <C-s> :w<CR>

" Copy/Cut/Paste
map <silent> <C-c> "+y
map <silent> <S-c> "+y
map <silent> <leader>c "+y

map <silent> <C-x> "+x
map <silent> <S-x> "+x
map <silent> <leader>x "+x

"map <silent> <C-v> "+p
"map <silent> <S-v> "+p
map <silent> <leader>v "+p
map <silent> <leader>V "+P

" Move to next/prev Tab page
map <silent> <C-Left> :tabp<CR>
map <silent> <C-Right> :tabn<CR>

nnoremap <silent> <ESC> :noh<CR>

" Execute macro over visual range
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
