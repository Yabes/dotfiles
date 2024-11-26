-- Undotree
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
