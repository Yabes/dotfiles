return {
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "lua_ls",
        -- "vtsls",
        -- "ts_ls",
        "bashls",
        "dockerls",
        "jsonls",
        "graphql",
        "terraformls",
        "rust_analyzer",
        "cssls",
        "css_variables",
        "eslint",
        "somesass_ls",
        "biome",
        "helm_ls",
      },
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "jayp0521/mason-null-ls.nvim",

    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- "stylua",
        "jq",
        "prettierd",
        -- "eslint_d",
        -- "eslint",
        "stylelint-lsp",
        "kube-linter",
      },
      automatic_setup = true,
    },
  },
}
