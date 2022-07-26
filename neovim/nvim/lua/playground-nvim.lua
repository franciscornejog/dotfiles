return { 'nvim-treesitter/playground', config = function()
    vim.keymap.set('n', ' tp', ':TSPlaygroundToggle<cr>')
    vim.keymap.set('n', ' th', ':TSHighlightCapturesUnderCursor<cr>')
end }

