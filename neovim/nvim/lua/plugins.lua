local fn = vim.fn
local installPath = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(installPath)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', installPath})
end

return require('packer').startup({{
    require 'plug.packer',
    require 'plug.noired',
    require 'plug.plenary',
    require 'plug.jdtls',
    require 'plug.lspkind',
    require 'plug.lspconfig',
    require 'plug.luasnip',
    require 'plug.cmp-luasnip',
    require 'plug.cmp-buffer',
    require 'plug.cmp-path',
    require 'plug.cmp-lua',
    require 'plug.cmp-lsp',
    require 'plug.cmp',
    require 'plug.telescope',
    require 'plug.treesitter',
    require 'plug.playground',
    require 'plug.colorizer',
    require 'plug.gitsigns',
    require 'plug.fugitive',
}})