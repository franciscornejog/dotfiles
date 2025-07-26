require('lazy').setup('plugins')
require('neoam')

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set('n', ' ds', function() vim.pretty_print(vim.diagnostic.get_namespaces()) end)
vim.keymap.set('n', ' m', ':make<cr>')
vim.keymap.set('n', ' co', ':copen<cr>')
vim.keymap.set('n', ' cc', ':cclose<cr>')
vim.keymap.set('n', ' w', ':write<cr>')
vim.keymap.set('n', ' x', ':exit<cr>')
vim.keymap.set('n', ' rr', ':write <bar> :make<cr>')

vim.keymap.set('n', ' fv', ':tabedit ~/.config/nvim/init.lua<cr>') -- edit nvim config
vim.keymap.set('n', 'n', 'nzzzv')   -- Recenter after each search jump
vim.keymap.set('n', 'N', 'Nzzzv')   -- Recenter after each search jump
vim.keymap.set('n', 'J', 'mjJ`j')   -- Keep position after join

vim.o.expandtab = true              -- Turn tab to spaces
vim.o.shiftwidth = 2                -- Indent with spaces
vim.o.smartindent = true            -- Smart auto indenting
vim.o.tabstop = 2                   -- Set tab width
vim.o.conceallevel = 2              -- enable conceal
