vim.cmd.compiler('pyunit')
vim.o.makeprg = 'python3 %'
vim.opt.errorformat:append({ '%-G%.%#' })
