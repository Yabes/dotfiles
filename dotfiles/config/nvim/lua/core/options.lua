-- Default shell
vim.opt.shell = "zsh -i"

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

-- -----------------------------------------------------------------------------
-- Indentation {{{1
-- -----------------------------------------------------------------------------

vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

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

vim.opt.completeopt = { "menu", "preview" }

-- configure ripgrep as grep program if available
if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --no-heading --vimgrep"
  vim.o.grepformat = "%f:%l:%c:%m"
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

-- If wrapping, indent wrapping text
vim.opt.breakindent = true

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.timeoutlen = 500

vim.opt.updatetime = 200

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

-- Always show current position
vim.opt.ruler = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Set height of command bar
vim.opt.cmdheight = 1

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- Stabilize ui on split
vim.opt.splitkeep = "screen"

-- Preview :s results in a split
vim.opt.inccommand = "split"

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
-- Colors & fonts {{{1
-- -----------------------------------------------------------------------------

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
-- pcall(vim.cmd, "colorscheme kanagawa")

-- -----------------------------------------------------------------------------
-- Lang & regional settings {{{1
-- -----------------------------------------------------------------------------

vim.opt.spelllang = { "en", "fr" }
vim.opt.spell = false

-- netrw
-- auto close netrw buffers
vim.g.netrw_fastbrowse = 0

-- @TODO: keep this one?
-- vim.g.loaded_matchparen = 1
