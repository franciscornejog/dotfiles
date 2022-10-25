-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

require('plugins')
require('work')

vim.keymap.set('n', ' fv', ':tabedit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mjJ`j')
vim.keymap.set('n', 'gb', ':bnext<cr>')
vim.keymap.set('n', 'gB', ':bprevious<cr>')

vim.opt.colorcolumn = '80'             -- Highlight column line
vim.opt.cursorline = true              -- Highlight cursor line
vim.opt.expandtab = true               -- Turn tab to spaces
vim.opt.ignorecase = true              -- Search case insensitive
vim.opt.number = true                  -- Show number lines
vim.opt.shiftwidth = 4                 -- Indent with spaces
vim.opt.signcolumn = 'yes:1'           -- Show info beside text
vim.opt.smartcase = true               -- Search case sensitive when uppercase
vim.opt.smartindent = true             -- Smart auto indenting
vim.opt.tabstop = 4                    -- Set tab width
vim.opt.undofile = true                -- Save undo outside editor
