""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has('win16') || has('win32')
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""
command! -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
command! Ga execute 'Git add %'
command! Gc execute 'Gcommit --verbose'


""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_mode='a'


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
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="hybrid"
let g:airline_powerline_fonts = 1
let g:airline_right_sep="\ue0b2"
let g:airline_left_sep="\ue0b0"

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
let g:syntastic_typescript_checkers=['tslint']
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"
let g:syntastic_javascript_checkers = ['eslint']
au FileType jsx let g:syntastic_javascript_checkers = ['jsx']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker for vim8)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \   'javascript': ['xo'],
  \   'typescript': ['tslint'],
  \   'php': [ 'php -l', 'phpmd' ],
  \   'dockerfile': ['hadolint'],
  \   'vim': ['vint'],
  \   'sass': ['sass-lint']
  \ }

let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'css,scss': [ 're!^\s{2,}', 're!:\s+', '!', '@' ],
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
" => SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = '<C-n>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UtilSnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
autocmd FileType js UltiSnipsAddFiletypes javascript-angular


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autoclose = 0
let g:tagbar_singleclick = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_filetype='scss,css,html'


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
    set nocursorline
    colorscheme PaperColor
    Limelight
    set guifont=FiraCode-Regular:h16
    set wrap
    set breakindent
endfunction

function! s:goyo_leave()
    set background=dark
    set linespace=0
    set cursorline
    colorscheme flatcolor
    Limelight!
    set guifont=FiraCode-Regular:h11
    set nowrap
    set nobreakindent
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :Tagbar<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yank Ring
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>y :YRShow<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyAlign
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <Enter> :EasyAlign<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-JsDoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Sideways
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-peekaboo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:peekaboo_delay = 750


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutBackInsert = '<C-b>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenmatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_matchparen = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/CloudStation/wiki', 'path_html': '~/CloudStation/wiki_html/'}]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header = [
      \ '                              ',
      \ '            __                ',
      \ '    __  __ /\_\    ___ ___    ',
      \ '   /\ \/\ \\/\ \ /'' __` __`\ ',
      \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
      \ '    \ \___/  \ \_\ \_\ \_\ \_\',
      \ '     \/__/    \/_/\/_/\/_/\/_/',
      \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_try_formatprg = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :Files<cr>
nnoremap <C-b> :Buffers<cr>

let g:fzf_layout = { 'down': '~20%' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('editorconfig')
    let g:EditorConfig_core_mode = 'external_command'
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
else
    let g:EditorConfig_core_mode = 'python_external'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => identLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_faster = 1
