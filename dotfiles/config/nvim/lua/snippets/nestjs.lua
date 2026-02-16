local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local l = require("luasnip.extras").lambda
local dl = require("luasnip.extras").dynamic_lambda

ls.add_snippets("typescript", {

  s(
    "test",
    fmt(
      [[
{{}}

1: {filename}

2: {filename}

]],
      {
        filename = dl(1, l.TM_FILENAME_BASE, {}),
      }
    )
  ),
})

-- ls.add_snippets("typescript", {
--   s(
--     "ctrlmod",
--     fmt([[
-- import {{ Module }} from '@nestjs/common';
--
-- import {{ MapperModule }} from '@/mappers/mapper.module.js';
-- import {{ {}ServiceModule }} from '@/services/{}/{}.service.module.js';
--
-- import {{ {}Controller }} from './{}.controller.js';
--
-- @Module({{
--   imports: [{}ServiceModule, MapperModule],
--   providers: [],
--   controllers: [{}Controller],
-- }})
-- export class {}ControllerModule {{ }}
-- ]]),
--     {
--       i(1),
--       i(2),
--       i(3),
--       i(4),
--       i(5),
--       i(6),
--       i(7),
--       i(8),
--     }
--   ),
-- })
