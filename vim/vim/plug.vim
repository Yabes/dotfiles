call plug#begin()

""""""""""""""""""""""""""""""
" => Syntax Plugins
""""""""""""""""""""""""""""""
" Linting
" if has('job') || has('nvim')
"   Plug 'w0rp/ale'
" endif

"Plug 'tpope/vim-surround'
"Plug 'sheerun/vim-polyglot'

"" JavaScript
"Plug 'elzr/vim-json', { 'for': [ 'javascript', 'json' ] }
"" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"" Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'jsx' ] }
"Plug 'ElmCast/elm-vim', { 'for': ['elm'] }

"" HTML/CSS
"" Plug 'mattn/emmet-vim', { 'for': [ 'html', 'twig', 'javascript', 'jsx' ] }
"Plug 'othree/html5.vim', { 'for': [ 'html', 'twig' ] }
"Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
"Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss'] }

"" PHP
"Plug 'StanAngeloff/php.vim', { 'for': 'php' }

"" Other
"Plug 'chrisbra/csv.vim', { 'for': 'csv' }
"Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
"" TODO ISNTALL ?
"Plug 'vitalk/vim-shebang'
"Plug 'cespare/vim-toml', { 'for': 'toml' }
"Plug 'lervag/vimtex', { 'for': ['tex', 'plaintex'] }
"Plug 'delphinus/vim-firestore'
"" TODO ISNTALL ?
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"""""""""""""""""""""""""""""""
"" => Completion
"""""""""""""""""""""""""""""""
"Plug 'jiangmiao/auto-pairs'

"if has('nvim')
"  Plug 'Shougo/neco-vim', { 'for': 'vim' }
"  Plug 'neoclide/coc-neco', { 'for': 'vim' }
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  " Plug 'Shougo/echodoc.vim'
"elseif has('python3')
"  Plug 'autozimu/LanguageClient-neovim', {
"        \ 'branch': 'next',
"        \ 'do': 'bash install.sh',
"        \ }
"  Plug 'reasonml-editor/vim-reason-plus'
"  Plug 'Shougo/deoplete.nvim', { 'tag': '4.1' }
"  Plug 'roxma/vim-hug-neovim-rpc'
"  Plug 'roxma/nvim-yarp'
"endif

"""""""""""""""""""""""""""""""
"" => Snippets
"""""""""""""""""""""""""""""""
"" Plug 'SirVer/ultisnips'


"""""""""""""""""""""""""""""""
"" => File Plugins
"""""""""""""""""""""""""""""""
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'antoinemadec/coc-fzf'
"Plug 'mileszs/ack.vim'
"Plug 'eiginn/netrw'
"Plug 'kopischke/vim-fetch'

"""""""""""""""""""""""""""""""
"" => Look & Feel Plugins
"""""""""""""""""""""""""""""""
"Plug 'chrisbra/Colorizer', { 'for': ['html', 'css', 'scss'] }
"" Plug 'Yggdroot/indentLine'
"" Plug 'Valloric/MatchTagAlways'

"Plug 'airblade/vim-gitgutter'
"Plug 'whiteinge/diffconflicts'
"Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'
"Plug 'shinchu/lightline-gruvbox.vim'

"Plug 'christoomey/vim-tmux-navigator'

"""""""""""""""""""""""""""""""
"" => Colors Plugins
"""""""""""""""""""""""""""""""
"" Plug 'MaxSt/FlatColor'
"Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'
"Plug 'NLKNguyen/papercolor-theme'


"""""""""""""""""""""""""""""""
"" => Motion Plugins
"""""""""""""""""""""""""""""""
"Plug 'matze/vim-move'


"""""""""""""""""""""""""""""""
"" => Text Object Plugins
"""""""""""""""""""""""""""""""
"Plug 'kana/vim-textobj-user'
"Plug 'michaeljsmith/vim-indent-object'
"Plug 'kana/vim-textobj-entire'
"Plug 'kana/vim-textobj-function'
"Plug 'glts/vim-textobj-comment'
"Plug 'mattn/vim-textobj-url'
"Plug 'Julian/vim-textobj-variable-segment'
"Plug 'terryma/vim-expand-region'


"""""""""""""""""""""""""""""""
"" => Git Plugins
"""""""""""""""""""""""""""""""
"Plug 'tpope/vim-fugitive'

"Plug 'junegunn/gv.vim', { 'on': 'GV' }


"""""""""""""""""""""""""""""""
"" => Utils Plugins
"""""""""""""""""""""""""""""""
"Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
"Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
"Plug 'sickill/vim-pasta'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-vinegar'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-eunuch'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
"Plug 'arecarn/fold-cycle.vim'
"Plug 'tomtom/tcomment_vim'
"" Plug 'vim-scripts/YankRing.vim'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/visual-split.vim', { 'on': ['VSSplit', 'VSSplitAbove', 'VSSplitBelow', 'VSResize'] }
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'AndrewRadev/sideways.vim'
"" Plug 'vim-scripts/ReplaceWithRegister'
"Plug 'henrik/vim-indexed-search'
"Plug 'dohsimpson/vim-macroeditor', { 'on': 'MacroEdit' }
"Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
"Plug 'tpope/vim-speeddating'
"" Plug 'brooth/far.vim', { 'on': 'Far' }
"" Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
"" Plug 'tpope/vim-unimpaired'
"" Plug 'hauleth/sad.vim'

"" Close buffer without closing the window with `Bdelete`
"Plug 'moll/vim-bbye'

"if has('job') || has('nvim')
"    Plug 'chrisbra/vim-autoread', { 'on': 'AutoRead' }
"endif

"" Cheat sheet & help
"Plug 'lifepillar/vim-cheat40'
"Plug 'ktonga/vim-follow-my-lead'

"Plug 'itchyny/vim-parenmatch'

call plug#end()
