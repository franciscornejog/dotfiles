return { 'tpope/vim-fugitive',
    requires = { 'lewis6991/gitsigns.nvim' },
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', ' gS', ':Git<cr>')
        vim.keymap.set('n', ' gl', ':Git log<cr>')
        vim.keymap.set('n', ' gc', ':Git commit<cr>')
        vim.keymap.set('n', ' gp', ':Git push<cr>')
    end
}

