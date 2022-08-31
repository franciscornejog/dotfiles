return { 'wbthomason/packer.nvim', config = function()
    vim.keymap.set('n', ' rs', ':PackerSync<cr>')
end }

