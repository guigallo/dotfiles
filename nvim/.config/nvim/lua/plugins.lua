local M = {}

function M.setup()
-- Indicate first time installation
local packer_bootstrap = false

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

  --
  -- User interface
  --
  use {
    "arcticicestudio/nord-vim",
    config = function() vim.cmd "colorscheme nord" end
  }

  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function() require("config.web-devicons").setup() end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function() require("config.lualine").setup() end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  use {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function() vim.notify = require "notify" end,
  }

  use {
    "scrooloose/nerdtree",
    config = function() require("config.nerdtree").setup() end,
  }

  use { "Xuyuanp/nerdtree-git-plugin", requires = { "scrooloose/nerdtree" } }

  use {
    "kien/ctrlp.vim",
    event = "VimEnter",
    config = function() require("config.ctrlp").setup() end,
  }

  use { "tpope/vim-fugitive" }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("config.treesitter") end,
  }

  use { "arkav/lualine-lsp-progress" }

  use {
    "ibhagwan/fzf-lua",
    event = "BufEnter",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function() require("config.whichkey").setup() end,
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

  --
  -- Coding
  --
  use {
    "airblade/vim-gitgutter",
    config = function() require("config.gitgutter").setup() end,
  }

  use { "tpope/vim-commentary" }

  use { "stylelint/stylelint" }

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

  use {
    "windwp/nvim-autopairs",
    wants = "nvim-treesitter",
    module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
    config = function() require("config.autopairs").setup() end,
  }

  use { "fatih/vim-go", run = ":GoUpdateBinaries" }

  use { "b0o/schemastore.nvim" }

  --
  -- LSP
  --
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = { "nvim-cmp", "nvim-lsp-installer", "lsp_signature.nvim" },
    config = function() require("config.lsp").setup() end,
    requires = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    disable = false,
    event = "InsertEnter",
    opt = true,
    config = function() require("config.cmp").setup() end,
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        config = function() require("config.luasnip").setup() end,
      },
      "rafamadriz/friendly-snippets",
    },
  }

  use {
  	"folke/trouble.nvim",
  	requires = "kyazdani42/nvim-web-devicons",
  	config = function() require("trouble").setup { } end
  }

  --
  -- Vimspector
  --
  use {
    "puremourning/vimspector",
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    fn = {
      "vimspector#Launch()",
      "vimspector#ToggleBreakpoint",
      "vimspector#Continue",
    },
    config = function() require("config.vimspector").setup() end,
  }

  -- DAP
  --
  -- use {
  --   "mfussenegger/nvim-dap",
  --   opt = true,
  --   event = "BufReadPre",
  --   module = { "dap" },
  --   wants = {
  --     "nvim-dap-virtual-text",
  --     "DAPInstall.nvim",
  --     "nvim-dap-ui",
  --     "nvim-dap-python",
  --     "which-key.nvim",
  --   },
  --   requires = {
  --     "Pocco81/DAPInstall.nvim",
  --     "theHamsta/nvim-dap-virtual-text",
  --     "rcarriga/nvim-dap-ui",
  --     "mfussenegger/nvim-dap-python",
  --     "nvim-telescope/telescope-dap.nvim",
  --     { "leoluz/nvim-dap-go", module = "dap-go" },
  --     { "jbyuki/one-small-step-for-vimkind", module = "osv" },
  --   },
  --   config = function()
  --     require("config.dap").setup()
  --   end,
  -- }

  -- use { "mfussenegger/nvim-dap-python" }

  --
  -- Sync
  --
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
