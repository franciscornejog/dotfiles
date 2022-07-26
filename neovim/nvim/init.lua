-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

require('plugins')
require('work')

-- Insert when open and enter terminal
vim.api.nvim_create_autocmd({'TermOpen', 'BufEnter'}, {
    pattern = 'term://*', command = 'start',
})

vim.cmd('colorscheme noired')                  -- Set colorscheme

vim.keymap.set('n', ' fv', ':edit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mjJ`j')
vim.keymap.set('t', '<C-w>N', '<C-\\><C-N>')
vim.keymap.set('t', '<C-w>h', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-w>j', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-w>k', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-w>l', '<C-\\><C-N><C-w>l')

vim.opt.colorcolumn = '80'                     -- Highlight column line
vim.opt.cursorline = true                      -- Highlight cursor line
vim.opt.expandtab = true                       -- Turn tab to spaces
vim.opt.number = true                          -- Show number lines
vim.opt.shiftwidth = 4                         -- Indent with spaces
vim.opt.signcolumn = 'yes:1'                   -- Show info beside text
vim.opt.smartindent = true                     -- Smart auto indenting
vim.opt.tabstop = 4                            -- Set tab width
vim.opt.undofile = true                        -- Save undo outside editor
