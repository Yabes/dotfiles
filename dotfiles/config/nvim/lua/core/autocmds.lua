local aucmd = vim.api.nvim_create_autocmd

aucmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank()
  end,
})

aucmd({ "BufRead", "BufNewFile" }, {
  pattern = "COMMIT_EDITMSG",
  command = ":set colorcolumn=50,72",
})

vim.cmd([[
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
]])

--- https://github.com/sainnhe/everforest
--- https://github.com/vimpostor/vim-prism
aucmd({ "OptionSet" }, {
  pattern = "background",
  callback = function()
    if vim.o.background == "dark" then
      vim.cmd.colorscheme("kanagawa")
    else
      vim.cmd.colorscheme("everforest")
    end
  end,
})
