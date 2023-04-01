return { 'lewis6991/gitsigns.nvim', 'tpope/vim-fugitive',
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', ' gl', ':Git log<cr>')
        vim.keymap.set('n', ' gc', ':Git commit<cr>')
        vim.keymap.set('n', ' gp', ':Git push<cr>')
    end
}

