"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <leader>p :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'


""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
let g:NERDTreeWinPos = "left"

map <leader>n :NERDTreeToggle<cr>
"map <leader>nn :NERDTreeTabsToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion   = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tern
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tern_show_argument_hints='on_move'
let g:tern_show_signature_in_pum=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UtilSnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autoclose = 0
let g:tagbar_singleclick = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_filetype='css,html'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LimeLight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter
autocmd! User GoyoLeave

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
    set background=light
    set linespace=7
    set lines=41
    set columns=141
    Limelight
    NERDTreeClose
endfunction

function! s:goyo_leave()
    set background=dark
    set linespace=0
    Limelight!
    NERDTree
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-pasta
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Follow my lead
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fml_all_sources=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHPComplete Extended
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_index_composer_command = "php /usr/bin/composer.phar"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Stack Answers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:stack_filter = "top"

