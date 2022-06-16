local M = {}

function M.setup()
  vim.cmd([[
    let g:NERDTreeGitStatusUseNerdFonts=1
    let g:NERDTreeShowHidden = 1
  ]])
end

return M
