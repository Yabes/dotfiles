local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local l = require("luasnip.extras").lambda
local dl = require("luasnip.extras").dynamic_lambda

ls.add_snippets("typescriptreact", {
  s(
    "rfc",
    fmt(
      [[
import {{ FC }} from 'react';

type {}Props = {{ {} }};

export const {}: FC<{}Props> = ({{ {} }}) => {{
  return <div>{}</div>;
}};
]],
      {
        dl(1, l.TM_FILENAME_BASE, {}),
        i(2),
        f(function(args)
          return args[1][1]
        end, { 1 }),
        f(function(args)
          return args[1][1]
        end, { 1 }),

        i(3),
        i(4),
      }
    )
  ),
})
