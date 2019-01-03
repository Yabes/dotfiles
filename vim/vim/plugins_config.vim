""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""

let g:yankring_max_history = 10
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
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="hybrid"
let g:airline_powerline_fonts = 1
let g:airline_right_sep="\ue0b2"
let g:airline_left_sep="\ue0b0"
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['branch', 'whitespace']

if has('nvim')
  call add(g:airline_extensions, 'coc')
endif

if has('job') || has('nvim')
  call add(g:airline_extensions, 'ale')
endif

let g:airline#extensions#branch#format = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2


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
" => UtilSnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'


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
" => Neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_try_formatprg = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :GitFiles<cr>
nnoremap <leader>f :Files<cr>
nnoremap <C-b> :Buffers<cr>

let g:fzf_layout = { 'down': '~30%' }
let g:fzf_buffers_jump = 1


command! -bang -nargs=* RgFiles
  \ call fzf#run(
  \   fzf#wrap({
  \     'source': 'rg --files --hidden --follow . ',
  \     'options': '--exit-0 --select-1 --query '.shellescape(<q-args>)
  \   }),
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0
  \ )

command! -bang -nargs=* RgSearch
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --hidden --follow --ignore-case '.shellescape(<q-args>),
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0
  \ )

nnoremap <leader>rg :RgSearch <C-r><C-w><cr>
nnoremap <leader>rG :RgSearch <C-r>=expand("<cWORD>")<cr><cr>
nnoremap <leader>rm :RgSearch <C-r>=expand("%:t:r")<cr>.<C-r><C-w><cr>
nnoremap <leader>rf :RgFiles <C-r><C-w><cr>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3')
  let g:LanguageClient_serverCommands = {
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['javascript-typescript-stdio'],
        \ 'reason': ['ocaml-language-server', '--stdio'],
        \ 'ocaml': ['ocaml-language-server', '--stdio'],
        \ 'json': ['vscode-json-languageservice'],
        \ 'sh': ['bash-language-server', 'start'],
        \ 'zsh': ['bash-language-server', 'start'],
        \ 'dockerfile': ['docker-langserver', '--stdio'],
        \ 'html': ['html-languageserver', '--stdio'],
        \ 'css': ['css-languageserver', '--stdio'],
        \ 'scss': ['css-languageserver', '--stdio'],
        \ 'yml': ['yaml-language-server', '--stdio'],
        \ 'php': ['php', '~/.config/composer/vendor/felixfbecker/language-server/bin/php-language-server.php'],
        \ }

  let g:deoplete#enable_at_startup = 1
endif
