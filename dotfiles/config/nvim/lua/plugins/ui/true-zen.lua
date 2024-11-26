return {
  "Pocco81/true-zen.nvim",
  cmd = { "TZFocus", "TZNarrow", "TZAtaraxis" },
  config = function()
    require("true-zen").setup({
      integrations = {
        lualine = true,
      },
      modes = {
        ataraxis = {
          callbacks = {
            open_pre = function()
              vim.opt.wrap = true
            end,
            close_pre = function()
              vim.opt.wrap = false
            end,
          },
        },
      },
    })
  end,
}
