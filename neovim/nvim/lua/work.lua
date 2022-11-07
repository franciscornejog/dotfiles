-- Set filetype for Apex files
vim.filetype.add({ extension = {
    st = 'apexcode',
    cls = 'apexcode',
    trigger = 'apexcode',
    apex = 'apexcode',
    cmp = 'html',
}})

-- Deploy Apex components
local bufnr = nil
local attach_to_buffer = function(group, pattern, command)
    vim.api.nvim_create_autocmd('BufWritePost', {
	    group = group,
	    pattern = pattern,
	    callback = function()
		local path = vim.fn.expand('%')
		vim.cmd('botright split output')
		bufnr = vim.api.nvim_get_current_buf()
		vim.bo.buftype = 'nofile'
		vim.bo.swapfile = false
		vim.bo.bufhidden = 'wipe'
		local append_data = function(_, data)
		    if data then
			vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
		    end
		end
		vim.fn.jobstart(command .. path, {
		    stdout_buffered = true,
		    on_stdout = append_data,
		    on_stderr = append_data,
		})
	    end
	})
end
local sfgroup = vim.api.nvim_create_augroup('SFComponents', { clear = true })
local pattern = { '*.cls', '*.trigger', '*.apex' }
local command = "sfdx force:source:deploy --sourcepath="
-- sfdx force:source:deploy --sourcepath=" .. path .. " --json | jq '.result[]' -r"
attach_to_buffer(sfgroup, pattern, command)

-- Deploy LWC components
vim.api.nvim_create_autocmd('BufWritePost', {
    group = sfgroup,
    pattern = { '*/lwc/*/*.js', '*/lwc/*/*.html', '*/lwc/*/*.css' },
    command = '!sfdx force:source:deploy -p %:h',
})
