-- Set filetype for Apex files
vim.filetype.add({ extension = {
    st = 'apexcode',
    cls = 'apexcode',
    trigger = 'apexcode',
    apex = 'apexcode',
    cmp = 'html',
}})

-- Deploy current component when saved
vim.api.nvim_create_autocmd({'BufWritePost'}, {
    pattern = {'*.cls', '*.trigger', '*.apex', 'lwc/*/*.js', 'lwc/*/*.html', 'lwc/*/*.css'},
    command = '!sfdx force:source:deploy -p %',
})
