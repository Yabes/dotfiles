local has_value = require("utils.table").has_value

local on_attach = function(client, bufnr)
  vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>so", function()
    require("telescope.builtin").lsp_document_symbols()
  end, opts)

  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true)

    vim.keymap.set("n", "<Leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle [L]SP Inlay [H]int" })
  end

  local external_formatter = { "ts_ls", "vtsls", "jsonls", "lua_ls" }
  if has_value(external_formatter, client.name) then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

  -- NOTE: Format on save autocommand
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd({ "BufWrite" }, {
  --     group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
  --     callback = function()
  --       -- WARN: use false, otherwise not possible to save
  --       vim.lsp.buf.format({ async = false })
  --     end,
  --   })
  -- end
end

local function lsp_config()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local overrides = { "bashls", "jsonls", "lua_ls", "marksman", "vtsls", "ts_ls", "yamlls" }

  for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    local lsp_opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Extend base config with overrides
    if has_value(overrides, server) then
      local extra_opts = require("plugins.lsp.settings." .. server)
      lsp_opts = vim.tbl_deep_extend("force", extra_opts, lsp_opts)
    end

    -- Configure any LSP server except rust_analyzer
    if server ~= "rust_analyzer" then
      lspconfig[server].setup(lsp_opts)
    end

    -- Might not be usefull with rustaceanvim
    -- lspconfig.rust_analyzer.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     ["rust-analyzer"] = {
    --       diagnostics = {
    --         enable = true,
    --       },
    --       checkOnSave = {
    --         command = "clippy",
    --       },
    --     },
    --   },
    -- })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
end

return {
  {
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPost", "BufNewFile" },
      cmd = { "LspInfo", "LspInstall", "LspUninstall" },
      config = lsp_config,

      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
      },
    },
  },

  {
    "aznhe21/actions-preview.nvim",
    opts = {},
    keys = {
      {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        mode = { "v", "n" },
        desc = "Code action preview",
      },
    },
  },
}
