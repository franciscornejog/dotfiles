-- Set filetype for Apex files
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.cls', '*.trigger', '*.apex'},
    command = 'set filetype=apexcode',
})

-- Deploy current component when saved
vim.api.nvim_create_autocmd({'BufWrite'}, {
    pattern = {'*.cls', '*.trigger', '*.apex', '*.html', '*.css', '*.js'},
    command = '!sfdx force:source:deploy -p %',
})



