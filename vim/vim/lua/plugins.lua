local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	-- Package manager
	use({
		"wbthomason/packer.nvim",
		config = { compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
	})
	use("lewis6991/impatient.nvim")

	use("folke/neodev.nvim")

	-- git
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("whiteinge/diffconflicts")

	-- "gc" to comment visual regions/lines
	-- TODO lua equivalent?
	-- vs tcomment?
	-- use("tpope/vim-commentary")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("tpope/vim-repeat")
	use("tpope/vim-abolish")
	use("tpope/vim-eunuch")

	-- Better explorer config
	use("tpope/vim-vinegar")

	-- Surround word with... stuff, y'know
	use("tpope/vim-surround")

	--
	use("editorconfig/editorconfig-vim")

	--
	use("arecarn/fold-cycle.vim")

	--
	use("vim-scripts/ReplaceWithRegister")

	--
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	})

	--
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	use({ "wellle/visual-split.vim", cmd = "VSSplit" })

	use({ "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" } })
	use({ "AndrewRadev/sideways.vim", keys = { "<C-h>", "<C-l>" } })
	use({ "chrisbra/vim-autoread", cmd = "AutoRead" })

	use({ "metakirby5/codi.vim", cmd = "Codi" })

	use({ "dhruvasagar/vim-zoom", keys = { "<C-w>m" } })

	-- UI to select things (files, grep results, open buffers...)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "telescope-fzf-native.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
				pickers = {
					buffers = {
						ignore_current_buffer = true,
						sort_lastused = true,
						sort_mru = true,
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
		end,
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Fancier statusline
	-- use("itchyny/lightline.vim")
	-- use("maximbaz/lightline-ale")
  -- stylua: ignore

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
		local default_colors = require("kanagawa.colors").setup()
		local custom_kanagawa = require("lualine.themes.kanagawa")
		custom_kanagawa.normal.c.bg = default_colors.sumiInk1

		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
				theme = custom_kanagawa,
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "  " } },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = { "fileformat" },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "coc" },
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
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
		end,
	})

	-- Add indentation guides even on blank lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "┊",
				filetype_exclude = { "help", "packer" },
				buftypu_exclude = { "terminal", "nofile" },
				show_trailing_blankline_indent = false,
				show_current_context = true,
			})
		end,
	})

	use("bogado/file-line")

	-- -- Add git related info in the signs columns and popups
	-- -- Highlight, edit, and navigate code using a fast incremental parsing library
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true, -- false will disable the whole extension
				},
				indent = {
					enable = true,
				},
				disable = function(lang, bufnr) -- Disable in large C++ buffers
					return vim.api.nvim_buf_line_count(bufnr) > 5000
				end,
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aa"] = "@attribute.outer",
							["ia"] = "@attribute.inner",
						},
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			})
		end,
	})

	-- use({
	-- 	"code-biscuits/nvim-biscuits",
	-- 	config = function()
	-- 		require("nvim-biscuits").setup({
	-- 			default_config = {
	-- 				max_length = 24,
	-- 				min_distance = 80,
	-- 				prefix_string = "📎 ",
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- -- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- completion
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	})

	-- use({
	-- 	"williamboman/mason.nvim",
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	"jayp0521/mason-null-ls.nvim",
	-- })

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				config = function()
					-- require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		},
		config = [[require('config.cmp')]],
	})

	use("b0o/schemastore.nvim")

	-- Highlight colors
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html" },
		config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
	})

	-- colors
	-- use("morhetz/gruvbox")
	-- use("shinchu/lightline-gruvbox.vim")
	use("NLKNguyen/papercolor-theme")
	use({ "rebelot/kanagawa.nvim" })

	-- Undo tree
	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
	})

	-- Nicely handle buffers
	-- use { 'mhinz/vim-sayonara', cmd = 'Sayonara' }

	use({
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				check_ts = true,
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
				auto_select = true, -- automatically select the first item
				insert = false, -- use insert confirm behavior instead of replace
				enable_check_bracket_line = false,
			})

			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
		end,
	})

	use({
		"tversteeg/registers.nvim",
		cmd = "Registers",
		config = function()
			require("registers").setup()
		end,
	})

	-- use({ "https://gitlab.com/yorickpeterse/nvim-pqf.git", config = function()
	--   require('pqf').setup()
	-- end})

	use("romainl/vim-cool")

	require("packer").use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>CodeActionMenu<CR>", { noremap = true, silent = true })
		end,
	})

	use("lambdalisue/suda.vim")

	use("delphinus/vim-firestore")

	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			-- { "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup({
				-- enable_persistent_history = true,
			})
		end,
	})

	use("kyazdani42/nvim-web-devicons", {
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
