local cache = {}

local fs = require("vim.fs")

function __cwd()
  local current_file = vim.fn.expand("%")
  local current_file_dir = vim.fn.fnamemodify(current_file, ":p:h")

  if cache[current_file_dir] ~= nil then
    return cache[current_file_dir]
  end

  local path_search = current_file_dir .. ";"

  local package_dirname = vim.fn.findfile("package.json", path_search)

  if package_dirname ~= nil then
    cache[current_file_dir] = fs.basename(vim.fn.fnamemodify(package_dirname, ":p:h"))
    return cache[current_file_dir]
  end

  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    local dot_git_path = vim.fn.finddir(".git", path_search)
    return "[G] " .. vim.fn.fnamemodify(dot_git_path, ":h")
  end

  local cwd = vim.fn.getcwd()
  local cwd_dirname = vim.fn.fnamemodify(cwd, ":p:h:~")
  return "[C] " .. cwd_dirname
end

function cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
        theme = "auto",
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "  " } },
        },
        lualine_b = {
          __cwd,
          { "filename", path = 4 },
          {
            "branch",
            fmt = function(str)
              return str:sub(1, 9)
            end,
          },
        },
        lualine_c = { "fileformat" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            -- Displays diagnostics for the defined severity types
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "  " } },
        },
      },
      inactive_sections = {
        lualine_a = { { "filename", path = 4 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
