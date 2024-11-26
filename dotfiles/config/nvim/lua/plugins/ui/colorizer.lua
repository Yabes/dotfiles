-- Highlight colors
return {
  "norcalli/nvim-colorizer.lua",
  ft = { "css", "scss", "javascript", "html" },
  config = function()
    require("colorizer").setup({ "css", "scss", "javascript", "html" }, {
      css = true,
    })
  end,
}
