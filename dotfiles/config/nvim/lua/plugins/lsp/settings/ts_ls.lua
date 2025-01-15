local filter = require("utils.table").filter

local function filterReactDTS(value)
  return string.match(value.uri or value.targetUri, "react/index.d.ts") == nil
end

return {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative",
    },
  },
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
}
