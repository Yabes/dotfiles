return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip").config.set_config({
      enable_autosnippets = false,
    })

    local types = require("luasnip.util.types")
    local ls = require("luasnip")
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { " <- Current Choice", "NonTest" } },
          },
        },
      },
    })

    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("snippets")
  end,
}
