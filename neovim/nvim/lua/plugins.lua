local fn = vim.fn
local url = 'https://github.com/wbthomason/packer.nvim'
local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', url, path})
end

local plugins = {
    require('packer-nvim'), -- package manager
    require('plenary-nvim'), -- helper
    require('mason-nvim'), -- lsp
    require('mason-lspconfig-nvim'),
    require('cmp-nvim'), -- autocompletion
    require('luasnip-nvim'), -- snippets
    require('autopairs-nvim'), -- autocomplete pairs
    require('telescope-nvim'), -- fuzzy finder
    require('treesitter-nvim'), -- syntax tree
    require('playground-nvim'), -- show syntax
    require('colorizer-nvim'), -- show colors
    require('comment-nvim'), -- comment
    require('gitsigns-nvim'), -- git
    require('surround-nvim'), -- surround
    require('gruvbox-nvim'), -- theme
    require('neotest-nvim'), -- test
}

return require('packer').startup({ plugins })
