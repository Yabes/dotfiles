local M = {}

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree = {}

local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local function is_git_repo()
  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  return is_inside_work_tree[cwd]
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

local function getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

M.project_files = function(opts)
  if is_git_repo() then
    opts = opts or { use_git_root = false }
    opts.show_untracked = true
    -- opts.git_command = { "-c", "core.quotepath=false", "ls-files", "--exclude-standard", "--cached" }

    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

M.grep_string_visual = function()
  local opts = {
    default_text = getVisualSelection(),
    only_sort_text = true,
  }

  if is_git_repo() then
    opts.cwd = get_git_root()
  else
    opts.cwd = utils.buffer_dir()
  end

  builtin.live_grep(opts)
end

return M
