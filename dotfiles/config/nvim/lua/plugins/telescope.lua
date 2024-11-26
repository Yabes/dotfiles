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
