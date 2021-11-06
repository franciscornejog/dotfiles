return { 
    'nvim-telescope/telescope.nvim', 
    config = function()
        local m = require('keymap')
        m.n(' ff', ":lua require('telescope.builtin').find_files()<cr>")
    end
}

