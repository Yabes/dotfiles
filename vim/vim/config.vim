""""""""""""""""""""""""""""""
" @author Matthis LC
""""""""""""""""""""""""""""""

" Lang settings
set spelllang=en,fr
set spell

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=rRlLmT

" Number display
set number
set relativenumber

" Hide mode, replaced by airline
set noshowmode

" No wrap words
set nowrap

" Patched font with icon
set guifont=Bitstream\ Vera\ Sans\ Mono\ PNFT\ M\ 10

" unified theme

if has("gui_running")
    colorscheme flatcolor
else
    colorscheme desert
endif

let g:airline_theme="luna"

" Timeout
set ttimeout
set ttimeoutlen=100

set cursorline

" Placeholder img
function! s:PlaceholderImgTag(size)
  let url = 'http://dummyimage.com/' . a:size . '/000000/555555'
  let [width,height] = split(a:size, 'x')
  execute "normal a<img src=\"".url."\" width=\"".width."\" height=\"".height."\" />"
endfunction
command! -nargs=1 PlaceholderImgTag call s:PlaceholderImgTag(<f-args>)

" Split
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/vim_config/config.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim/vim_config/config.vim


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

