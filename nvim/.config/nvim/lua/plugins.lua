local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = true

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Theme
    use {
      "arcticicestudio/nord-vim",
      config = function() vim.cmd "colorscheme nord" end
    }
    use {
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
		}
    use { "airblade/vim-gitgutter" }
    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = function() require("config.lualine").setup() end,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }

		--
    -- User interface
		--

    use {
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function() vim.notify = require "notify" end,
    }

    use { "scrooloose/nerdtree" }
    use { "Xuyuanp/nerdtree-git-plugin", requires = { "scrooloose/nerdtree" } }
    use { "kien/ctrlp.vim" }
    use { "tpope/vim-fugitive" }
    use {
	    "nvim-treesitter/nvim-treesitter",
	    run = ":TSUpdate",
	    config = function() require("config.treesitter") end,
    }
    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      module = "nvim-gps",
      config = function() require("nvim-gps").setup() end,
    }
    use { "arkav/lualine-lsp-progress" }
    use {
      "ibhagwan/fzf-lua",
       requires = { "kyazdani42/nvim-web-devicons" },
    }
    -- WhichKey
    use {
       "folke/which-key.nvim",
       event = "VimEnter",
       config = function() require("config.whichkey").setup() end,
    }
    use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
          select = { backend = { "telescope", "fzf", "builtin" } },
        }
      end,
    }
    use {
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			as = "telescope",
			requires = { "nvim-lua/plenary.nvim" }
		}
		use {
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function() require("config.bufferline").setup() end,
    }

		-- Coding
    use { "tpope/vim-commentary" }
    use { "stylelint/stylelint" }
		-- use { "rstacruz/vim-closer" }
    use {
			"prettier/vim-prettier",
			run = "yarn install --frozen-lockfile --production",
			ft = {
				"javascript", "javascriptreact", "typescript", "typescriptreact",
				"html", "css", "less", "scss",
				"json", "yaml",
				"go", "lua", "graphql", "markdown",
			},
		}

		-- Go
    use { "fatih/vim-go", run = ":GoUpdateBinaries" }

		-- LSP
    use { "neovim/nvim-lspconfig" }
    use { "L3MON4D3/LuaSnip" }
    use {
			"hrsh7th/nvim-cmp",
			config = function ()
				require'cmp'.setup {
				snippet = {
					expand = function(args) require'luasnip'.lsp_expand(args.body) end
				},

				sources = {
					{ name = 'luasnip' },
					-- more sources
				},
			}
			end
		}
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "saadparwaiz1/cmp_luasnip" }
    use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function() require("trouble").setup { } end
		}

		-- DAP
    use { "mfussenegger/nvim-dap" }
    use { "nvim-telescope/telescope-dap.nvim" }
    use { "mfussenegger/nvim-dap-python" }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()
  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
