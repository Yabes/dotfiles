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
