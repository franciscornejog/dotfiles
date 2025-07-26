      ['jdtls'] = function()
        require('lspconfig').jdtls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          root_dir = require('lspconfig').util.root_pattern('pom.xml', 'build.gradle', '.git') or vim.fn.getcwd(),
        })
      end,
