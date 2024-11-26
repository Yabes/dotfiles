local has_words_before = require("utils.buffer").has_words_before

local function cmp_config()
  local luasnip = require("luasnip")
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete({}),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "lazydev", group_index = 0 },
      { name = "path" },
      { name = "buffer" },
    },
    window = {
      completion = { -- rounded border; thin-style scrollbar
        border = "rounded",
      },
      documentation = { -- no border; native-style scrollbar
        border = "rounded",
      },
    },
  })

  -- cmp.setup.cmdline(":", {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = "path" },
  --     { name = "cmdline" },
  --     { name = "buffer" },
  --   }),
  --   -- use only the text
  --   formatting = { fields = { "abbr" } },
  -- })

  -- cmp.setup.cmdline(":", {
  --   -- C-n/C-p cycle through completions if a character has been typed and through
  --   -- command history if not (from https://www.reddit.com/r/neovim/comments/v5pfmy/comment/ibb61w3/)
  --   mapping = cmp.mapping.preset.cmdline({
  --     ["<C-n>"] = { c = cmp.mapping.select_next_item() },
  --     ["<C-p>"] = { c = cmp.mapping.select_prev_item() },
  --     ["<Up>"] = { c = cmp.mapping.select_next_item() },
  --     ["<Down>"] = { c = cmp.mapping.select_prev_item() },
  --   }),
  --   sources = cmp.config.sources({
  --     { name = "path" },
  --   }, {
  --     { name = "cmdline" },
  --   }, {
  --     { name = "buffer" },
  --   }),
  -- })
  --
  -- -- `/` cmdline setup.
  -- cmp.setup.cmdline("/", {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = "buffer" },
  --     { name = "nvim_lsp_document_symbol" },
  --   },
  --   -- use only the text
  --   formatting = { fields = { "abbr" } },
  -- })
  --
  -- -- more on: https://github.com/windwp/nvim-autopairs autopairs setup
  -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  -- local handlers = require("nvim-autopairs.completion.handlers")
  -- cmp.event:on(
  --   "confirm_done",
  --   cmp_autopairs.on_confirm_done({
  --     filetypes = {
  --       -- "*" is a alias to all filetypes
  --       ["*"] = {
  --         ["("] = {
  --           kind = {
  --             cmp.lsp.CompletionItemKind.Function,
  --             cmp.lsp.CompletionItemKind.Method,
  --           },
  --           handler = handlers["*"],
  --         },
  --       },
  --       -- Disable for tex
  --       tex = false,
  --     },
  --   })
  -- )
end

return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    -- "lukas-reineke/cmp-rg",
    -- "f3fora/cmp-spell",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = cmp_config,
}
