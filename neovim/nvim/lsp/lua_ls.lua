--@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'hs', 'vim'},
      },
      runtime = {
        version = 'LuaJIT'
      },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.env.VIMRUNTIME .. '/lua',
          vim.env.VIMRUNTIME .. '/lua/vim/lsp',
          vim.env.VIMRUNTIME .. '/lua/vim/diagnostic',
          '${3rd}/luv/library',
          '${3rd}/love2d/library',
        },
      },
    },
  },
}
