return { 'norcalli/nvim-colorizer.lua', config = function()
    vim.keymap.set('n', ' tc', ':ColorizerToggle<cr>')
end }

