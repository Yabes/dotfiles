call plug#begin()

""""""""""""""""""""""""""""""
" => Syntax Plugins
""""""""""""""""""""""""""""""
" Multi-purpose plugins
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'

" JavaScript
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'dir': '~/.vim/plugged/tern_for_vim', 'do': 'npm install' }
Plug '1995eaton/vim-better-javascript-completion' , { 'for': 'javascript' }
Plug 'othree/jspc.vim' , { 'for': 'javascript' }
Plug 'itspriddle/vim-jquery', { 'for': 'javascript' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': [ 'javascript', 'json' ] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'jsx' ] }
Plug 'othree/jsdoc-syntax.vim', { 'for': 'javaScript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'isRuslan/vim-es6'

" HTML/CSS
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'twig' ] }
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
Plug 'vitalk/vim-shebang'
Plug 'james9909/stackanswers.vim', { 'dir': '~', 'do': 'sudo pip install requests' }

""""""""""""""""""""""""""""""
" => Completion
""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'yes \| ./install.py' }


""""""""""""""""""""""""""""""
" => Snippets
""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'


""""""""""""""""""""""""""""""
" => File Plugins
""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mru.vim'


""""""""""""""""""""""""""""""
" => NerdTree Plugins
""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'jistr/vim-nerdtree-tabs', { 'on' : 'NERDTreeTabsToggle' }
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
Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/vim-emoji'
Plug 'haya14busa/incsearch.vim'


""""""""""""""""""""""""""""""
" => Colors Plugins
""""""""""""""""""""""""""""""
Plug 'MaxSt/FlatColor'


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
"Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'arecarn/fold-cycle.vim'
Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'ktonga/vim-follow-my-lead'
Plug 'arecarn/fold-cycle.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-commentary'
Plug 'vim-scripts/YankRing.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'wellle/visual-split.vim'
Plug 'junegunn/vim-easy-align'

call plug#end()
