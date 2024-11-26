return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
        theme = "auto",
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "  " } },
        },
        lualine_b = { { "filename", path = 4 }, "branch" },
        lualine_c = { "fileformat" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            -- Displays diagnostics for the defined severity types
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "  " } },
        },
      },
      inactive_sections = {
        lualine_a = { { "filename", path = 4 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
