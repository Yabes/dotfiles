vim.filetype.add({
  extension = {
    ["jsonl"] = "json",
    ["rules"] = "firestore",
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
