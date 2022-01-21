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

function! LightlineDirName() abort
  return fnamemodify(getcwd(tabpagewinnr(0), 0), ':t')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'dirname', 'gitbranch', 'readonly', 'relativepath', 'modified' ],
      \             [ 'coc' ]],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'dirname', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'GetCocStatus',
      \   'coc': 'coc#status',
      \   'gitbranch': 'fugitive#head',
      \   'dirname': 'LightlineDirName'
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

" If it's already defined, we call it to reload Lightline
if exists("*LightlineReload")
    call LightlineReload()
endif

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:colorizer_auto_filetype='scss,css,html'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-pasta
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Follow my lead
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:fml_all_sources=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yank Ring
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent> <leader>y :YRShow<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyAlign
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap <silent> <Enter> :EasyAlign<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-JsDoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jsdoc_enable_es6 = 1
" let g:jsdoc_allow_input_prompt = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1


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

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


command! -bang -nargs=* RgFiles
  \ call fzf#run(
  \   fzf#wrap({
  \     'source': 'rg --files --hidden --follow -g "!.git" . ',
  \     'options': '--exit-0 --select-1 --query '.shellescape(<q-args>)
  \   }),
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0
  \ )

command! -bang -nargs=* RgSearch
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --hidden -g "!.git" --follow --ignore-case '.shellescape(<q-args>),
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => identLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_faster = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')
  " Coc.nvim
  let g:coc_snippet_next = '<c-j>'
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(cc-snippets-expand-jump)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nmap <silent> gsd :call CocAction('jumpDefinition', 'split')<CR>
  nmap <silent> gvd :call CocAction('jumpDefinition', 'vsplit')<CR>

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <silent><leader>a  <Plug>(coc-codeaction-selected)
  nmap <silent><leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <silent><leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <silent><leader>qf  <Plug>(coc-fix-current)

elseif has('python3')
  " LSP

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
" => Tmux navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>   :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Elm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:elm_setup_keybindings = 0

let g:yats_host_keyword = 0

" let g:over_enable_auto_nohlsearch = 1
" let g:over_enable_cmd_window = 1
" let g:over#command_line#substitute#replace_pattern_visually = 1
