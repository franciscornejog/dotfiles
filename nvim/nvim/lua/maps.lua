local map = vim.api.nvim_set_keymap
local options = { noremap = true }

vim.g.mapleader = ' '
map('n', ' ', '', {})
map('n', ' ve', ':edit ~/.config/nvim/init.lua<cr>', options)
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', 'J', 'mjJ`j', options)

map('t', '<C-w>N', '<C-\\><C-N>', options)
map('t', '<C-w>h', '<C-\\><C-N><C-w>h', options)
map('t', '<C-w>j', '<C-\\><C-N><C-w>j', options)
map('t', '<C-w>k', '<C-\\><C-N><C-w>k', options)
map('t', '<C-w>l', '<C-\\><C-N><C-w>l', options)


