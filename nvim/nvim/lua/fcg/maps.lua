local m = require 'keymap'

vim.g.mapleader = ' '
m.map('n', ' ', '', {})
m.map('n', ' ve', ':edit ~/.config/nvim/init.lua<cr>')
m.map('n', 'n', 'nzzzv')
m.map('n', 'N', 'Nzzzv')
m.map('n', 'J', 'mjJ`j')

m.map('t', '<C-w>N', '<C-\\><C-N>')
m.map('t', '<C-w>h', '<C-\\><C-N><C-w>h')
m.map('t', '<C-w>j', '<C-\\><C-N><C-w>j')
m.map('t', '<C-w>k', '<C-\\><C-N><C-w>k')
m.map('t', '<C-w>l', '<C-\\><C-N><C-w>l')


