return {
  -- "morhetz/gruvbox",

  { "NLKNguyen/papercolor-theme", lazy = true },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  -- "EdenEast/nightfox.nvim"
}
