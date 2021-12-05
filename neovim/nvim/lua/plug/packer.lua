return { 
    'wbthomason/packer.nvim',
    config = function()
        local m = require('keymap')
        m.n(' ps', ":lua require('packer').sync()<cr>")
    end
}

