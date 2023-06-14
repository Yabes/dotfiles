require("impatient")

-- https://github.com/renerocksai/telekasten.nvim
-- https://github.com/Furkanzmc/zettelkasten.nvim

vim.filetype.add({
	extension = {
		["jsonl"] = "json",
	},
	filename = {
		["Fastfile"] = "ruby",
		[".eslintrc"] = "json",
		[".czrc"] = "json",
		[".huskyrc"] = "json",
		[".lintstagedrc"] = "json",
		[".gitignore"] = "conf",
		[".dockerignore"] = "conf",
		[".ignore"] = "conf",
		["config"] = "sshconfig",
	},
	pattern = {
		["Jenkinsfile.*"] = "groovy",
		["cheat40.*"] = "cheat40",
		[".env.*"] = "sh",
	},
})

-- Default shell
vim.opt.shell = "zsh"

-- TODO doc me
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "full" }
vim.opt.wildignore = { "*.i", "*~", "*.pyc", "*/.git/*" }

-- Execute local rc file if any
vim.opt.exrc = true

-- Configure backspace so it acts as it should act
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.whichwrap = { b = true, s = true, ["<"] = true, [">"] = true, h = true, l = true }

-- Enable mouse support
vim.opt.mouse = "a"

-- How many tenths of a second to blink when matching brackets
vim.opt.matchtime = 2

-- Remove extra commant marker when joining lines
vim.opt.formatoptions:append({ "j" })

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess:append({ c = true })

-- Hide vim splash screen
vim.opt.shortmess:append({ I = true })

-- shorter <Esc> delay
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- Set utf8 as standard encoding and en_US as the standard language
vim.opt.encoding = "utf8"

-- Use Unix as the standard file type
vim.opt.fileformats = { "unix", "dos", "mac" }

-- A buffer becomes hidden when it is abandoned
vim.opt.hidden = true

-- TODO still needed with a new formater plugin?
-- autocmd FileType c,cpp,python,ruby,java,javascript,php,vim autocmd BufWritePre <buffer> :%s/\s\+$//e
-- noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

-- TODO See YT video about that
-- command! W w !sudo tee % > /dev/null

--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copy/Paste in systemclipboard
vim.api.nvim_set_keymap("n", "<leader>c", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>c", '"+y', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>v", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>v", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>V", '"+P', { noremap = true, silent = true })

-- TODO navigate between pane without TmuxPlugin

-- Execute macro over visual range
-- https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
-- TODO still needed?
-- xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.cmd([[
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
]])

-- TODO not working, plz fix

-- Preview :s results in a split
vim.opt.inccommand = "split"

vim.api.nvim_set_keymap(
	"n",
	"<PageDown>",
	"(&buftype is# \"quickfix\" || empty(filter(tabpagebuflist(), 'getbufvar(v:val, \"&buftype\") is# \"quickfix\"'))) ? '<PageDown>' : ':cn<CR>'",
	{ noremap = true, silent = true, expr = true }
)

vim.api.nvim_set_keymap("n", "[q", ":cn<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "]q", ":cp<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<PageUp>",
	"(&buftype is# \"quickfix\" || empty(filter(tabpagebuflist(), 'getbufvar(v:val, \"&buftype\") is# \"quickfix\"'))) ? '<PageUp>' : ':cp<CR>'",
	{ noremap = true, silent = true, expr = true }
)

vim.api.nvim_set_keymap("n", "<leader>e", ":e! ~/.config/nvim/init.lua<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":e! ~/.config/nvim/lua/plugins.lua<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<F5>", ":UndotreeToggle<CR>", { noremap = true })

-- Keep the cursor in place while joining line
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

-- Open neovlip
vim.api.nvim_set_keymap("n", '""', "", {
	noremap = true,
	silent = true,
	callback = function()
		require("telescope").extensions.neoclip.default()
	end,
})

-- Bootstrap packer
require("plugins")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- -----------------------------------------------------------------------------
-- Indentation {{{1
-- -----------------------------------------------------------------------------

vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

-- -----------------------------------------------------------------------------
-- Search {{{1
-- -----------------------------------------------------------------------------
--
-- For regular expressions turn magic on
vim.opt.magic = true

-- Hide search results when pressing twice <ESC>
-- vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":noh<CR>", { noremap = true, silent = true })

-- Ignore case when searching
vim.opt.ignorecase = true

-- When searching try to be smart about cases
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Update grepprg to a faster cmd in favor of pt
if vim.fn.executable("ag") == 1 then
	vim.opt.grepprg = "ag"
end

if vim.fn.executable("pt") == 1 then
	vim.opt.grepprg = "pt"
end

-- -----------------------------------------------------------------------------
-- Window management {{{1
-- -----------------------------------------------------------------------------

-- Split config
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Specify the behavior when switching between buffers (eg. quickfix)
vim.opt.switchbuf = { "useopen", "uselast" }
vim.opt.showtabline = 1

-- -----------------------------------------------------------------------------
-- UI {{{1
-- -----------------------------------------------------------------------------

vim.opt.showcmd = true

-- keep n lines arround the cursor when scrolling
vim.opt.scrolloff = 7

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- No wrap words
vim.opt.wrap = false

-- If wrapping, break at words end
vim.opt.linebreak = true

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.timeoutlen = 500

-- Add a bit extra margin to the left for fold markers
vim.opt.foldcolumn = "1"

-- Set extra options when running in GUI mode
if vim.fn.has("gui_running") == 1 then
	--  Disable scrollbars
	vim.opt.guioptions = ""
end

-- Show relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide mode, showed in custom status bar
vim.opt.showmode = false

-- Always show status line
-- TODO to check
vim.opt.laststatus = 2

-- Prefix for wrapped line
vim.opt.showbreak = "↳ "

-- Invisible chars
vim.opt.list = true
vim.opt.listchars = {
	tab = "▷⋯",
	trail = "·",
	nbsp = "␣",
}

-- Disabled syntax highlighting after 500 chars
vim.opt.synmaxcol = 500

-- SHow cursor line
vim.opt.cursorline = true

-- TODO still needed w/ customer statusline?
-- "Always show current position
vim.opt.ruler = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Set height of command bar
vim.opt.cmdheight = 1

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- -----------------------------------------------------------------------------
-- Colors & fonts {{{1
-- -----------------------------------------------------------------------------

-- TODO check me
-- vim.opt.t_Co = 256
if not vim.fn.has("gui_running") and not vim.fn.has("nvim") then
	vim.opt.term = "screen-256color"
end

if vim.fn.has("unix") == 1 then
	if vim.fn.has("macunix") == 1 then
		vim.opt.guifont = "FiraCode-Regular:h11"

		if vim.fn.has("gui_running") == 1 then
			vim.opt.macligatures = true
		end
	else
		vim.opt.guifont = "FuraCode Nerd Font 10"
	end
end

vim.opt.background = "dark"

-- True color support
if vim.fn.exists("+termguicolors") == 1 then
	vim.opt.termguicolors = true
	vim.cmd([[ set t_8f=^[[38;2;%lu;%lu;%lum ]])
	vim.cmd([[ set t_8b=^[[48;2;%lu;%lu;%lum ]])
end

-- vim.g.gruvbox_italic = 1
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme kanagawa")

-- -----------------------------------------------------------------------------
-- Lang & regional settings {{{1
-- -----------------------------------------------------------------------------

vim.opt.spelllang = { "en", "fr" }
vim.opt.spell = false

vim.api.nvim_set_keymap("n", "<leader>ss", ":setlocal spell!<CR>", { noremap = true })

-- -----------------------------------------------------------------------------
-- Files, backups and undo {{{1
-- -----------------------------------------------------------------------------

vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.config/nvim/undo/"

vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- -----------------------------------------------------------------------------
-- Plugins {{{1
-- -----------------------------------------------------------------------------
-- Tmux Navigator {{{2
if vim.fn.exists("$TMUX") == 1 then
	vim.g.tmux_navigator_no_mappings = 1
	vim.g.tmux_navigator_disable_when_zoomed = 1
	vim.g.tmux_navigator_no_mappings = 1

	vim.api.nvim_set_keymap("n", "<C-Left>", ":TmuxNavigateLeft", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Right>", ":TmuxNavigateRight", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Up>", ":TmuxNavigateUp", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Down>", ":TmuxNavigateDown", { noremap = true, silent = true })
else
	vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
end

-- lightline {{{2
vim.cmd([[
  function! LightlineDirName() abort
    return fnamemodify(getcwd(tabpagewinnr(0), 0), ':t')
  endfunction
]])

-- vim.g.lightline = {
-- 	colorscheme = "gruvbox",
-- 	active = {
-- 		left = { { "mode", "paste" }, { "dirname", "gitbranch", "readonly", "relativepath", "modified" } },
-- 		right = {
-- 			{ "zoom", "linter_checking", "linter_errors", "linter_warnings", "linter_ok", "lineinfo" },
-- 			{ "percent" },
-- 			{ "fileformat", "fileencoding", "filetype" },
-- 		},
-- 	},
-- 	inactive = {
-- 		left = { { "dirname", "filename", "modified" } },
-- 		right = { { "lineinfo" }, { "percent" } },
-- 	},
-- 	component_function = {
-- 		gitbranch = "fugitive#head",
-- 		dirname = "LightlineDirName",
-- 	},
-- 	tabline = {
-- 		left = { { "tabs" } },
-- 		right = {},
-- 	},
-- 	component_expand = {
-- 		linter_checking = "lightline#ale#checking",
-- 		linter_warnings = "lightline#ale#warnings",
-- 		linter_errors = "lightline#ale#errors",
-- 		linter_ok = "lightline#ale#ok",
-- 		zoom = "zoom#statusline",
-- 	},
-- 	component_type = {
-- 		linter_checking = "left",
-- 		linter_warnings = "error",
-- 		linter_errors = "error",
-- 		linter_ok = "left",
-- 		zoom = "error",
-- 	},
-- }

-- vim.cmd([[
--   " If it's already defined, we call it to reload Lightline
--   if exists("*LightlineReload")
--       call LightlineReload()
--   endif

--   function! LightlineReload()
--     call lightline#init()
--     call lightline#colorscheme()
--     call lightline#update()
--   endfunction
-- ]])

-- Ale {{{2
vim.g.ale_echo_msg_format = "[%linter%] %s"
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 0

vim.api.nvim_set_keymap("n", "[a", "<Plug>(ale_previous_wrap)", { silent = true })
vim.api.nvim_set_keymap("n", "]a", "<Plug>(ale_next_wrap)", { silent = true })

-- Sideways {{{2
vim.api.nvim_set_keymap("n", "<C-h>", ":SidewaysLeft<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":SidewaysRight<CR>", { noremap = true })

vim.api.nvim_set_keymap("o", "aa", "<Plug>SidewaysArgumentTextobjA", {})
vim.api.nvim_set_keymap("x", "aa", "<Plug>SidewaysArgumentTextobjA", {})
vim.api.nvim_set_keymap("o", "ia", "<Plug>SidewaysArgumentTextobjI", {})
vim.api.nvim_set_keymap("x", "ia", "<Plug>SidewaysArgumentTextobjI", {})

-- vim-peekaboo {{{2
vim.g.peekaboo_delay = 750

-- parenmatch {{{2
-- TODO keep this one?
vim.g.loaded_matchparen = 1

-- Neoformat {{{2
-- TODO still using it?
vim.g.neoformat_try_formatprg = 1

-- fzf {{{2
vim.g.fzf_buffers_jump = 1
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":Telescope git_status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>rg", ":Telescope grep_string<CR>", { noremap = true })

-- LSP {{{2
-- TODO try it
-- vim.o.completeopt = 'menuone,noselect'

-- -----------------------------------------------------------------------------
-- Modeline {{{1
-- -----------------------------------------------------------------------------
-- vim: foldmethod=marker
