local project_config = require("core.project").get_project_config()

local jsts_config = { "prettierd", "prettier", stop_after_first = true }

if project_config.linter.js_ts == "biome" then
  table.insert(jsts_config, 1, "biome-check")
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      -- lua = { "stylua" },
      -- python = { "isort", "black" },
      -- javascript =
      -- javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      -- typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      -- typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
      javascript = jsts_config,
      javascriptreact = jsts_config,
      typescript = jsts_config,
      typescriptreact = jsts_config,
      json = { "biome-check" },
      css = { "biome-check" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
