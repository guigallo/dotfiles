local M = {}

function M.setup()
  require("nvim-web-devicons").setup { default = true }
  vim.cmd([[
    let g:NERDTreeGitStatusUseNerdFonts=1
    let g:NERDTreeShowHidden = 1
  ]])
end

return M
