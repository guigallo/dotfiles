local M = {}

function M.setup()
  -- vim.g["ctrlp_show_hidden"] = 1
  -- vim.g["ctrlp_custom_ignore"] = "\v[/](node_modules|target|dist)|(.(swp|ico|git|svn))$"

  vim.cmd([[
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
  ]])
end

return M
