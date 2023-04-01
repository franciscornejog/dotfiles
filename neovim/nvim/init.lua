-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

require('plugins')
require('work')
require('neoam')

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set('n', ' do', vim.diagnostic.open_float)
vim.keymap.set('n', ' dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', ' dn', vim.diagnostic.goto_next)
vim.keymap.set('n', ' dl', vim.diagnostic.setloclist)
vim.keymap.set('n', ' ds', function() vim.pretty_print(vim.diagnostic.get_namespaces()) end)

vim.keymap.set('n', ' fv', ':tabedit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', ' sf', ':source %<cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mjJ`j')
vim.keymap.set('n', 'gb', ':bnext<cr>')
vim.keymap.set('n', 'gB', ':bprevious<cr>')

vim.o.colorcolumn = '100'           -- Highlight column line
vim.o.cursorline = true             -- Highlight cursor line
vim.o.expandtab = true              -- Turn tab to spaces
vim.o.ignorecase = true             -- Search case insensitive
vim.o.number = true                 -- Show number lines
vim.o.shiftwidth = 4                -- Indent with spaces
vim.o.signcolumn = 'yes:1'          -- Show info beside text
vim.o.smartcase = true              -- Search case sensitive when uppercase
vim.o.smartindent = true            -- Smart auto indenting
vim.o.tabstop = 4                   -- Set tab width
vim.o.undofile = true               -- Save undo outside editor
vim.o.conceallevel = 2              -- enable conceal
