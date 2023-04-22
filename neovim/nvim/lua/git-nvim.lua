return { 'tpope/vim-fugitive',
    requires = { 'lewis6991/gitsigns.nvim' },
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', ' gS', ':Git<cr>')
        vim.keymap.set('n', ' gl', ':Git log<cr>')
        vim.keymap.set('n', ' gc', ':Git commit<cr>i')
        vim.keymap.set('n', ' gp', ':Git push<cr>')
        vim.keymap.set('n', ' gf', ':Git fetch<cr>')
        vim.keymap.set('n', ' ga', function() require('gitsigns').stage_buffer() end)
        vim.keymap.set('n', ' gh', function() require('gitsigns').stage_hunk() end)
        vim.keymap.set('n', ' grh', function() require('gitsigns').reset_hunk() end)
        vim.keymap.set('n', ' gb', function() require('gitsigns').blame_line({ full = true }) end)
    end
}

