local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.encoding = "UTF-8"
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = false --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 100 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.scrolloff = 8
opt.cmdheight = 2
opt.colorcolumn = "80"

-- WhichKey
opt.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.

-- File search
opt.path:remove "/usr/include"
opt.path:append "**"
opt.wildignorecase = true
opt.wildignore:append "**/coverage/*"
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/android/*"
opt.wildignore:append "**/ios/*"
opt.wildignore:append "**/.git/*"
opt.wildignore:append "**/.next/*"
opt.wildignore:append "**/build/*"
-- vim.cmd [[set path=.,,,$PWD/**]] -- Alternatively set the path

-- 
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.textwidth = 80
vim.bo.expandtab = true
vim.bo.autoindent = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
