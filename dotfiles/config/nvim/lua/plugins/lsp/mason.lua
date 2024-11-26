return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "bashls",
        "dockerls",
        "jsonls",
        "graphql",
        "terraformls",
        "rust_analyzer",
        "cssls",
        "css_variables",
      },
    },
  },
  {
    "jayp0521/mason-null-ls.nvim",

    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "stylua",
        "jq",
        "prettierd",
        "eslint_d",
        "stylelint-lsp",
      },
      automatic_installation = true,
      automatic_setup = true,
    },
  },
}
