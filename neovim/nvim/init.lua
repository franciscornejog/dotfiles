-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia

require 'fcg.maps'
require 'plugins'

vim.cmd('colorscheme noired')                  -- Set specified colorscheme
vim.opt.expandtab = true                       -- Turn tab to spaces
vim.opt.shiftwidth = 4                         -- Indent with specific white space
vim.opt.smartindent = true                     -- Smart auto indenting
vim.opt.softtabstop = 4                        -- Set specific white space
vim.opt.swapfile = false                       -- No swap files
vim.opt.tabstop = 4                            -- Set tab width
vim.opt.undofile = true                        -- Enable undo outside editor
vim.opt.exrc = true                            -- Source project vim configurations
vim.opt.shortmess = 'aoOtTcF'                  -- Abbreviate messages
vim.opt.showmode = false                       -- Remove mode indicators
vim.opt.updatetime = 50                        -- Lower update time
vim.opt.colorcolumn = '80'                     -- Highlight column line
vim.opt.cursorcolumn = true                    -- Highlight cursor column
vim.opt.cursorline = true                      -- Highlight cursor line
vim.opt.signcolumn = 'yes:1'                   -- Show more info beside text
vim.opt.wrap = false                           -- Do not wrap

vim.cmd([[augroup terminalSetup
    autocmd!
    autocmd TermOpen * startinsert             
    autocmd TermOpen * setlocal nonumber       
    autocmd TermOpen * setlocal nospell        
    autocmd BufEnter term://* startinsert      
augroup end]])

-- Insert when open term
-- Remove line number when open term
-- Remove spellcheck when open term
-- Insert when enter term

local m = require 'keymap'
vim.g.mapleader = ' '
m.map('n', ' ', '')
m.map('n', ' ve', ':edit ~/.config/nvim/init.lua<cr>')
m.map('n', 'n', 'nzzzv')
m.map('n', 'N', 'Nzzzv')
m.map('n', 'J', 'mjJ`j')
m.map('n', ' vc', ':set nocursorcolumn|set nocursorline<cr>')

m.map('t', '<C-w>N', '<C-\\><C-N>')
m.map('t', '<C-w>h', '<C-\\><C-N><C-w>h')
m.map('t', '<C-w>j', '<C-\\><C-N><C-w>j')
m.map('t', '<C-w>k', '<C-\\><C-N><C-w>k')
m.map('t', '<C-w>l', '<C-\\><C-N><C-w>l')

