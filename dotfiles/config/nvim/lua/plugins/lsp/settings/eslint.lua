local Path = require("plenary.path")

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

-- This path is used for finding a relative path to Yarn's SDK.
local nodePath = Path:new(get_git_root(), "./.yarn/sdks"):absolute() or ""

return {
  default_format_opts = {
    timeout_ms = 5000,
  },
  settings = {
    run = "onType",
    validate = "on",
    workspaceDirectory = {
      mode = "location",
    },
    -- Adds an absolute path to Yarn's SDK, or ""
    nodePath = nodePath,
  },
}
