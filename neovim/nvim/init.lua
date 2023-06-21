-- Personal Neovim Configuration
-- Author:  Francisco Cornejo-Garcia (franciscornejog)

require('plugins')
require('work')
require('neoam')

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set('n', ' do', vim.diagnostic.open_float)
vim.keymap.set('n', ' ds', function() vim.pretty_print(vim.diagnostic.get_namespaces()) end)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[q', ':cprevious<cr>')
vim.keymap.set('n', ']q', ':cnext<cr>')
vim.keymap.set('n', '[b', ':bprevious<cr>')
vim.keymap.set('n', ']b', ':bnext<cr>')
vim.keymap.set('n', ' m', ':make<cr>')
vim.keymap.set('n', ' co', ':copen<cr>')
vim.keymap.set('n', ' cc', ':cclose<cr>')
vim.keymap.set('n', ' w', ':write<cr>')
vim.keymap.set('n', ' x', ':exit<cr>')
vim.keymap.set('n', ' rr', ':write <bar> :make<cr>')

vim.keymap.set('n', ' fv', ':tabedit ~/.config/nvim/init.lua<cr>') -- edit nvim config
vim.keymap.set('n', ' sf', ':source %<cr>') -- source file
vim.keymap.set('n', 'n', 'nzzzv')   -- Recenter after each search jump
vim.keymap.set('n', 'N', 'Nzzzv')   -- Recenter after each search jump
vim.keymap.set('n', 'J', 'mjJ`j')   -- Keep position after join

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
