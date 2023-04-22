local namespace = vim.api.nvim_create_namespace('quickfix')
local diagnostics = vim.diagnostic.fromqflist(vim.fn.getqflist())
vim.diagnostic.set(namespace, 26, diagnostics)
