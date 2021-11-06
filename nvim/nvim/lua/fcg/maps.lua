local map = function(mode, lhs, rhs)
    local options = { noremap = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
map('n', ' ', '', {})
map('n', ' ve', ':edit ~/.config/nvim/init.lua<cr>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mjJ`j')

map('t', '<C-w>N', '<C-\\><C-N>')
map('t', '<C-w>h', '<C-\\><C-N><C-w>h')
map('t', '<C-w>j', '<C-\\><C-N><C-w>j')
map('t', '<C-w>k', '<C-\\><C-N><C-w>k')
map('t', '<C-w>l', '<C-\\><C-N><C-w>l')


