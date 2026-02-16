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
type Props = {{ {} }};

export const {}: React.FC<Props> = ({{ {} }}) => {{
  return <div>{}</div>;
}};
]],
      {
        i(2),
        dl(1, l.TM_FILENAME_BASE, {}),
        i(3),
        i(4),
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    "vitest",
    fmt(
      [[
import {{ describe, test, expect }} from 'vitest';

describe('{}', () => {{
  test('{}', () => {{
    const result = '';
    const expected = '';

    expect(result).toEqual(expected);
  }});
}});
 
]],
      {
        dl(1, l.TM_FILENAME_BASE, {}),
        i(2),
      }
    )
  ),
})
