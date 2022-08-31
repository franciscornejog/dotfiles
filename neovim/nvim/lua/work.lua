-- Set filetype for Apex files
vim.filetype.add({ extension = {
    st = 'apexcode',
    cls = 'apexcode',
    trigger = 'apexcode',
    apex = 'apexcode',
}})

-- Deploy current component when saved
vim.api.nvim_create_autocmd({'BufWrite'}, {
    pattern = {'*.cls', '*.trigger', '*.apex', 'lwc/*'},
    command = '!sfdx force:source:deploy -p %',
})
