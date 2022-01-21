-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia

require('plugins')

vim.cmd('colorscheme noired')                  -- Set specified colorscheme
vim.opt.colorcolumn = '80'                     -- Highlight column line
vim.opt.conceallevel = 2
vim.opt.cursorcolumn = true                    -- Highlight cursor column
vim.opt.cursorline = true                      -- Highlight cursor line
vim.opt.expandtab = true                       -- Turn tab to spaces
vim.opt.exrc = true                            -- Source project vim configurations
vim.opt.shiftwidth = 4                         -- Indent with specific white space
vim.opt.showmode = false                       -- Remove mode indicators
vim.opt.signcolumn = 'yes:1'                   -- Show more info beside text
vim.opt.smartindent = true                     -- Smart auto indenting
vim.opt.softtabstop = 4                        -- Set specific white space
vim.opt.tabstop = 4                            -- Set tab width
vim.opt.undofile = true                        -- Enable undo outside editor
vim.opt.updatetime = 50                        -- Lower update time
vim.opt.wrap = false                           -- Do not wrap

-- Insert when open term
-- Remove line number when open term
-- Remove spellcheck when open term
-- Insert when enter term
vim.cmd([[augroup terminalSetup
    autocmd!
    autocmd TermOpen * startinsert             
    autocmd TermOpen * setlocal nonumber       
    autocmd TermOpen * setlocal nospell        
    autocmd BufEnter term://* startinsert      
augroup end]])

vim.g.mapleader = ' '
vim.keymap.set('n', ' ', '')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mjJ`j')

vim.keymap.set('n', ' ve', ':edit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', ' vc', ':set nocursorcolumn|set nocursorline<cr>')

vim.keymap.set('t', '<C-w>N', '<C-\\><C-N>')
vim.keymap.set('t', '<C-w>h', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-w>j', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-w>k', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-w>l', '<C-\\><C-N><C-w>l')
