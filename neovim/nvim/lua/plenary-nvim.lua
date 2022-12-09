return { 'nvim-lua/plenary.nvim',
    config = function()
        vim.keymap.set('n', ' td', ':PlenaryBustedDirectory spec<cr>')
    end
}
