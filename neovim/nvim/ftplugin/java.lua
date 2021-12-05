local workspace_path = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-noverify',
        '-Xmx1G',
        '-jar', '/Users/fjcg/repositories/jdt-language-server-1.5.0-202110191539/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/Users/fjcg/repositories/jdt-language-server-1.5.0-202110191539/config_mac/',
        '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_path,
    },
    root_path = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
