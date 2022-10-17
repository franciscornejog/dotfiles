local fn = vim.fn
local url = 'https://github.com/wbthomason/packer.nvim'
local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', url, path})
end

local plugins = {
    require('packer-nvim'), -- package manager
    'nvim-lua/plenary.nvim', -- helper

    require('mason-nvim'),
    require('mason-lspconfig-nvim'),
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',

    require('cmp-nvim'), -- autocompletion
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip', -- snippet manager

    require('autopairs-nvim'), -- autocomplete pairs
    require('telescope-nvim'), -- fuzzy finder
    require('treesitter-nvim'), -- syntax tree
    require('playground-nvim'), -- show syntax
    require('colorizer-nvim'), -- show colors
    require('comment-nvim'), -- comment
    require('gitsigns-nvim'), -- git
    require('surround-nvim'), -- surround
    require('gruvbox-nvim'), -- theme

    '~/1_projects/neovim-plugin',
}

return require('packer').startup({ plugins })
