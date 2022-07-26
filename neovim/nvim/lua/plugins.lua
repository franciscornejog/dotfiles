local fn = vim.fn
local url = 'https://github.com/wbthomason/packer.nvim'
local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', url, path})
end

local config = {
    require('packer-nvim'), -- package manager
    require('colorizer-nvim'), -- show colors
    require('telescope-nvim'), -- fuzzy finder
    require('treesitter-nvim'), -- syntax tree
    require('playground-nvim'), -- show syntax
    require('cmp-nvim'), -- autocomplete
    require('lspconfig-nvim'), -- lsp
    'nvim-lua/plenary.nvim', -- helper
    'franciscornejog/noired.nvim', -- colorscheme
    'L3MON4D3/LuaSnip', -- snippet manager
    'saadparwaiz1/cmp_luasnip', -- snippets cmp source
    'hrsh7th/cmp-nvim-lsp', -- neovim lsp cmp source
    'hrsh7th/cmp-nvim-lua', -- lua api cmp source
    { 'simrat39/rust-tools.nvim', config = require('rust-tools').setup() },
    { 'numToStr/Comment.nvim', config = require('Comment').setup() },
    { 'mickael-menu/zk-nvim', config = require('zk').setup() },
    { 'lewis6991/gitsigns.nvim', config = require('gitsigns').setup() },
    { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup() end },
}

return require('packer').startup({ config })
