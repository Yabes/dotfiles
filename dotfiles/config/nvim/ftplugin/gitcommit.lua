local o = vim.opt_local

o.spell = true
o.colorcolumn = "50,72"

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("BufEnter", {
  pattern = "",
  -- command = "startinsert",
  -- command = "5r!git branch --show-current | grep -P '\\w{3,}-\\d{1,}' --only-matching",
  -- command = "norm itext",
  callback = function()
    local cmd = "git branch --show-current | grep -P '\\w{3,}-\\d{1,}' --only-matching"
    local handle = io.popen(cmd)

    if handle ~= nil then
      local result = handle:read("*a"):gsub("[\n\r]", "")
      handle:close()

      vim.api.nvim_buf_set_lines(0, 5, 5, false, { result })
      -- vim.cmd("w")
    end

    vim.api.nvim_win_set_cursor(0, { 2, 0 })
    vim.cmd("startinsert")
  end,
})
