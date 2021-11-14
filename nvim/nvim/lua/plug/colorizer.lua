return {
    'norcalli/nvim-colorizer.lua',
    config = function() 
        local m = require('keymap')
        m.n(' ct', ":ColorizerToggle<cr>")
    end,
}
