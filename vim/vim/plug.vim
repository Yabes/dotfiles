call plug#begin()

""""""""""""""""""""""""""""""
" => Syntax Plugins
""""""""""""""""""""""""""""""
" Multi-purpose plugins
if has('job')
  Plug 'w0rp/ale'
else
  Plug 'scrooloose/syntastic'
endif

Plug 'tpope/vim-surround'

" JavaScript
" Plug '1995eaton/vim-better-javascript-completion' , { 'for': 'javascript' }
" Plug 'itspriddle/vim-jquery', { 'for': 'javascript' }
" Plug 'burnettk/vim-angular', { 'for': 'javascript' }
" Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': [ 'javascript', 'json' ] }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'jsx' ] }
" Plug 'othree/jsdoc-syntax.vim', { 'for': 'javaScript' }
" Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets', { 'for': 'jsx' }
Plug 'KabbAmine/gulp-vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" HTML/CSS
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'twig', 'javascript', 'jsx' ] }
Plug 'othree/html5.vim', { 'for': [ 'html', 'twig' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['css', 'scss'] }

" PHP
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'm2mdas/phpcomplete-extended', { 'for': 'php' }
Plug 'vim-scripts/phpfolding.vim', { 'for': 'php' }
Plug 'dsawardekar/wordpress.vim', { 'for': 'php' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'evidens/vim-twig', { 'for': 'twig' }

" Other
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
Plug 'vitalk/vim-shebang'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'lervag/vimtex'

""""""""""""""""""""""""""""""
" => Completion
""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'yes \| ./install.py --tern-completer' }


""""""""""""""""""""""""""""""
" => Snippets
""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'


""""""""""""""""""""""""""""""
" => File Plugins
""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'eiginn/netrw'
" Plug 'mru.vim'


""""""""""""""""""""""""""""""
" => NerdTree Plugins
""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }


""""""""""""""""""""""""""""""
" => Look & Feel Plugins
""""""""""""""""""""""""""""""
Plug 'chrisbra/Colorizer'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'gregsexton/MatchTag'
Plug 'airblade/vim-gitgutter'
Plug 'amix/vim-zenroom2'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'

""""""""""""""""""""""""""""""
" => Colors Plugins
""""""""""""""""""""""""""""""
Plug 'MaxSt/FlatColor'
Plug 'NLKNguyen/papercolor-theme'

""""""""""""""""""""""""""""""
" => Motion Plugins
""""""""""""""""""""""""""""""
Plug 'matze/vim-move'
" Plug 'easymotion/vim-easymotion'
" Plug 'unblevable/quick-scope'


""""""""""""""""""""""""""""""
" => Text Object Plugins
""""""""""""""""""""""""""""""
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'mattn/vim-textobj-url'
" Plug 'wellle/targets.vim'


""""""""""""""""""""""""""""""
" => Git Plugins
""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


""""""""""""""""""""""""""""""
" => Utils Plugins
""""""""""""""""""""""""""""""
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'osyo-manga/vim-over'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
Plug 'arecarn/fold-cycle.vim'
Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'arecarn/fold-cycle.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'wellle/visual-split.vim'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'diepm/vim-rest-console', { 'for': 'rest' }
Plug 'AndrewRadev/sideways.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'henrik/vim-indexed-search'
Plug 'dohsimpson/vim-macroeditor', { 'on': 'MacroEdit' }
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'tpope/vim-speeddating'
Plug 'vimwiki/vimwiki', { 'on': 'VimwikiIndex' }
Plug 'brooth/far.vim', { 'on': 'Far' }
Plug 'yabes/vim-complete-commit-type'
Plug 'sbdchd/neoformat'

if has('job')
    Plug 'chrisbra/vim-autoread'
endif

" Cheatsheet & help
Plug 'lifepillar/vim-cheat40'
Plug 'ktonga/vim-follow-my-lead'

" Flash on yanking
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Optimization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'itchyny/vim-parenmatch'

" Should be loaded last
Plug 'ryanoasis/vim-devicons'

" No Name error if loaded before vim-devicons
" https://github.com/ctrlpvim/ctrlp.vim/pull/285
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
" Plug 'tracyone/ctrlp-leader-guide'

call plug#end()
