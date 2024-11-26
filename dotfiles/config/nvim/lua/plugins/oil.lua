return {
  -- https://github.com/stevearc/oil.nvim
  -- Alternatives:
  -- - "tpope/vim-vinegar",
  -- - https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-files.md
  -- - https://github.com/tamago324/lir.nvim
  {
    "stevearc/oil.nvim",
    opts = {
      columns = {
        "icon",
      },
      skip_confirm_for_simple_edits = true,
      float = {
        max_width = 200,
        max_height = 50,
      },
      view_options = {
        show_hidden = true,
        case_insensitive = true,
      },
      win_options = {
        winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
      },
      lsp_file_methods = {
        autosave_changes = "unmodified",
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    cmd = "Oil",
    keys = {
      { "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory" },
    },
  },
}
