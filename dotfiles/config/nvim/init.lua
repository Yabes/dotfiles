require("core.options")
require("core.filetype")
require("core.autocmds")
require("core.mappings")
require("core.lazy")
require("core.lsp")

if vim.fn.has("win32") == 1 then
  require("core.windows")
end
