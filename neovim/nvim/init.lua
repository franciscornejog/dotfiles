-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

require('plugins')

-- Insert when open and enter terminal
vim.api.nvim_create_autocmd({'TermOpen', 'BufEnter'}, {
    pattern = 'term://*', command = 'start',
})

-- Set filetype for Salesforce files
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.cls', '*.trigger', '*.apex'},
    command = 'set filetype=apexcode',
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

-- Salesforce Config
vim.api.nvim_create_autocmd({'BufWrite'}, {
    pattern = {'*.cls', '*.trigger', '*.apex', '*.html', '*.css', '*.js'},
    command = '!sfdx force:source:deploy -p %',
})

vim.opt.colorcolumn = '80'                     -- Highlight column line
vim.opt.cursorline = true                      -- Highlight cursor line
vim.opt.expandtab = true                       -- Turn tab to spaces
vim.opt.shiftwidth = 4                         -- Indent with spaces
vim.opt.signcolumn = 'yes:1'                   -- Show info beside text
vim.opt.smartindent = true                     -- Smart auto indenting
vim.opt.tabstop = 4                            -- Set tab width
vim.opt.undofile = true                        -- Save undo outside editor
