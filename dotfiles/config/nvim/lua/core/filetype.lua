local root_patterns = { ".git", ".clang-format", "pyproject.toml", "setup.py" }

vim.filetype.add({
  extension = {
    ["jsonl"] = "json",
    ["rules"] = "firestore",
    ["edi"] = "dsn",
    ["dsn"] = "dsn",
    ["txt"] = function(_path, bufnr)
      local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)

      local is_dsn = string.sub(first_line[1], 1, 3) == "S10"

      if is_dsn then
        return "dsn"
      end

      return "text"
    end,
    ["yaml"] = function(path)
      local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true, path = path })[1])

      if vim.uv.fs_stat(vim.fs.joinpath(root_dir, "ansible.cfg")) then
        return "yaml.ansible"
      end

      return "yaml"
    end,
  },
  filename = {
    ["Fastfile"] = "ruby",
    [".eslintrc"] = "json",
    [".czrc"] = "json",
    [".huskyrc"] = "json",
    [".lintstagedrc"] = "json",
    [".gitignore"] = "conf",
    [".dockerignore"] = "conf",
    [".ignore"] = "conf",
    ["config"] = "sshconfig",
  },
  pattern = {
    ["Jenkinsfile.*"] = "groovy",
    ["cheat40.*"] = "cheat40",
    [".env.*"] = "sh",
  },
})
