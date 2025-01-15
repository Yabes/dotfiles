return {
  -- UI to select things (files, grep results, open buffers...)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-f>", "<CMD>lua require'utils.telescope'.project_files()<CR>", noremap = true },
      { "<C-g>", ":Telescope git_status<CR>", noremap = true },
      { "<leader>f", ":Telescope file_browser<CR>", noremap = true },
      { "<C-b>", ":Telescope buffers<CR>", noremap = true },
      { "<leader>rg", ":Telescope grep_string<CR>", noremap = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            ["<Esc>"] = "close",
            ["<C-x>"] = "select_horizontal",
            ["<C-v>"] = "select_vertical",
            ["<C-f>"] = function(prompt_bufnr)
              -- @NOTE: https://github.com/nvim-telescope/telescope.nvim/issues/2016
              -- @TODO: configure it only for project_files, allow to toggle use_git_root
              local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
              local opts = {
                use_git_root = true,
                show_untracked = true,
                default_text = current_picker:_get_prompt(),
              }

              require("telescope.actions").close(prompt_bufnr)
              require("utils.telescope").project_files(opts)
            end,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
          sort_mru = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
    end,
  },

  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   dependencies = {
  --     { "nvim-telescope/telescope.nvim" },
  --   },
  -- },
}
