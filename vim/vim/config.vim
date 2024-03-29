""""""""""""""""""""""""""""""
" @author Matthis LC
""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on

" set shell
set shell=zsh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the WiLd menu
set wildmenu
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32')
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Always show sign column
set signcolumn=yes

" Execute local rc file if any
set exrc

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set visualbell t_vb=
set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

" Set extra options when running in GUI mode
if has('gui_running')
  set guitablabel=%M\ %t
  " Disable scrollbars
  set guioptions=
endif

" Number display
set number
set relativenumber

" Hide mode, replaced by airline
set noshowmode

" No wrap words
set nowrap

" Disable Syntax Highlighting after 500 char
set synmaxcol=500

set cursorline

" Config Split
set splitright
set splitbelow

" Always show the status line
set laststatus=2

" Show break if any
set showbreak=»\ "

" activate list to show trailing char
set list
set listchars=tab:\ \ ,trail:·,nbsp:␣

set formatoptions+=j

set showcmd

" don't give |ins-completion-menu| messages.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
if !has('gui_running') && !has('nvim')
  set term=screen-256color
endif

" Patched font with icon
if has('unix')
  if has('macunix')
    set guifont=FiraCode-Regular:h11

    if has('gui_running')
      set macligatures
    endif
  else
    set guifont=FuraCode\ Nerd\ Font\ 10
  endif
endif

" theme
set background=dark
try
  colorscheme gruvbox
catch
endtry

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Libs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3') && !has('nvim')
  set pyxversion=3

  if has('macunix')
    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lang & Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>
set spelllang=en,fr
set nospell

" Timeout
set ttimeout
set ttimeoutlen=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" A buffer becomes hidden when it is abandoned
set hidden

" Remove whitespace on save
autocmd FileType c,cpp,python,ruby,java,javascript,php,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = "\<space>"
let g:maplocalleader = "\<space>"

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has('mac') || has('macunix')
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=
nnoremap <leader>ss :setlocal spell!<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide search results when pressing twice <ESC>
nnoremap <silent> <ESC><ESC> :noh<CR>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Update grepprg to a faster cmd in favor of pt
if executable('ag')
  set grepprg=ag
endif

if executable('pt')
  set grepprg=pt
endif

set inccommand=split
set switchbuf=uselast
nnoremap <PageDown> :cn<CR>
nnoremap <PageUp> :cp<CR>

nnoremap <expr> <PageUp> filter(range(1, winnr('$')), 'getwinvar(v:val, "$ft") == "qf"') == [] ? '<PageUp>' : ':cp<CR>'
nnoremap <expr> <PageDown> filter(range(1, winnr('$')), 'getwinvar(v:val, "$ft") == "qf"') == [] ? '<PageDown>' : ':cn<CR>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :e! ~/.vim/config.vim<cr>


" I AM HERE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto create directory with :e
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Migrate to plugin?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easily replace words in files
" http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
"
" nnoremap cn *``cgn
" nnoremap cN *``cgN
"
" vnoremap <expr> cn g:mc . "``cgn"
" vnoremap <expr> cN g:mc . "``cgN"
"
" function! SetupCR()
"   nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
" endfunction
"
" nnoremap cq :call SetupCR()<CR>*``qz
" nnoremap cQ :call SetupCR()<CR>#``qz
"
" vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
" vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" autocmd CursorMoved * if &previewwindow != 1 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute macro over visual range
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim

" Get recent commit message

" make list-like commands more intuitive
" From https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
function! CCR()
  let cmdline = getcmdline()
  if cmdline =~ '\v\C^(ls|files|buffers)'
    " like :ls but prompts for a buffer command
    return "\<CR>:b"
  elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
    " like :g//# but prompts for a command
    return "\<CR>:"
  elseif cmdline =~ '\v\C^(dli|il)'
    " like :dlist or :ilist but prompts for a count for :djump or :ijump
    return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
  elseif cmdline =~ '\v\C^(cli|lli)'
    " like :clist or :llist but prompts for an error/location number
    return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
  elseif cmdline =~ '\C^old'
    " like :oldfiles but prompts for an old file to edit
    set nomore
    return "\<CR>:sil se more|e #<"
  elseif cmdline =~ '\C^changes'
    " like :changes but prompts for a change to jump to
    set nomore
    return "\<CR>:sil se more|norm! g;\<S-Left>"
  elseif cmdline =~ '\C^ju'
    " like :jumps but prompts for a position to jump to
    set nomore
    return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
  elseif cmdline =~ '\C^marks'
    " like :marks but prompts for a mark to jump to
    return "\<CR>:norm! `"
  elseif cmdline =~ '\C^undol'
    " like :undolist but prompts for a change to undo
    return "\<CR>:u "
  else
    return "\<CR>"
  endif
endfunction
cnoremap <expr> <CR> CCR()

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" Don't close window, when deleting a buffer
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
" endfunction

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
