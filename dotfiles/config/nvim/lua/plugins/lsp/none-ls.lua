local function setup()
  local null_ls = require("null-ls")

  local builtins = null_ls.builtins

  null_ls.setup({
    debug = false,
    on_attach = function(client, bufnr)
      -- NOTE: Format on save autocommand
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "BufWrite" }, {
          group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
          callback = function()
            -- WARN: use false, otherwise not possible to save
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
    sources = {
      -- require("none-ls.code_actions.eslint_d"),
      -- require("none-ls.code_actions.eslint"),

      builtins.diagnostics.zsh,
      builtins.diagnostics.stylelint,
      -- require("none-ls.diagnostics.eslint_d"),
      -- require("none-ls.diagnostics.eslint"),

      builtins.formatting.stylua,
      builtins.formatting.prettierd,
      builtins.formatting.shfmt,
      builtins.formatting.stylelint,
      -- require("none-ls.formatting.eslint_d"),
      -- require("none-ls.formatting.eslint"),
    },
  })
end

return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  config = setup,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "nvim-lua/plenary.nvim",
  },
}
