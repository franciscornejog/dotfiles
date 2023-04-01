local url = 'https://github.com/wbthomason/packer.nvim'
local path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', url, path })
end

local plugins = {
    require('packer-nvim'), -- package manager
    require('plenary-nvim'), -- helper
    require('mason-lspconfig-nvim'), -- lsp
    require('cmp-nvim'), -- autocompletion with snippets
    require('autopairs-nvim'), -- autocomplete pairs
    require('telescope-nvim'), -- fuzzy finder
    require('treesitter-nvim'), -- syntax tree
    require('playground-nvim'), -- show syntax
    require('colorizer-nvim'), -- show colors
    require('comment-nvim'), -- comment
    require('git-nvim'), -- git
    require('surround-nvim'), -- surround
    require('gruvbox-nvim'), -- theme
    require('neotest-nvim'), -- test
}

return require('packer').startup({ plugins })
