local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = { "lua", "rust", "javascript", "typescript", "go" },
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },
  }
end

return M
