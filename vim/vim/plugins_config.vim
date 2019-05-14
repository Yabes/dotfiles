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
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetCocStatus()
  return get(g:, 'coc_status', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ],
      \             [ 'coc' ]],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'GetCocStatus',
      \   'coc': 'coc#status',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ ]
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'error',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \
      \ }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_filetype='scss,css,html'


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

  let s:filetypes = join(keys(g:LanguageClient_serverCommands), ',')

  augroup lspMappings
    autocmd!
    execute 'autocmd FileType ' . s:filetypes . ' nnoremap <F4> :call LanguageClient_contextMenu()<CR>'
    execute 'autocmd FileType ' . s:filetypes . ' nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>'
    execute 'autocmd FileType ' . s:filetypes . ' nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>'
  augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>   :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
