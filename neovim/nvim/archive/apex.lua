-- Set filetype for Apex files
vim.filetype.add({ extension = {
    st = 'apexcode',
    cls = 'apexcode',
    trigger = 'apexcode',
    apex = 'apexcode',
    cmp = 'html',
}})

local sfgroup = vim.api.nvim_create_augroup('SFComponents', { clear = true })

-- Deploy Apex components
vim.api.nvim_create_autocmd('BufWritePost', {
    group = sfgroup,
    pattern = { '*.cls', '*.trigger', '*.apex' },
    command = '!sfdx force:source:deploy --sourcepath=%',
})
-- local bufnr = nil
-- local attach_to_buffer = function(group, pattern, command)
--     vim.api.nvim_create_autocmd('BufWritePost', {
-- 	    group = group,
-- 	    pattern = pattern,
-- 	    callback = function()
-- 		local path = vim.fn.expand('%')
-- 		vim.cmd('botright split output')
-- 		bufnr = vim.api.nvim_get_current_buf()
-- 		vim.bo.buftype = 'nofile'
-- 		vim.bo.swapfile = false
-- 		vim.bo.bufhidden = 'wipe'
-- 		local append_data = function(_, data)
-- 		    if data then
-- 			vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
-- 		    end
-- 		end
-- 		vim.fn.jobstart(command .. path, {
-- 		    stdout_buffered = true,
-- 		    on_stdout = append_data,
-- 		    on_stderr = append_data,
-- 		})
-- 	    end
-- 	})
-- end
-- sfdx force:source:deploy --sourcepath=" .. path .. " --json | jq '.result[]' -r"
-- attach_to_buffer(sfgroup, pattern, command)

-- Deploy LWC components
vim.api.nvim_create_autocmd('BufWritePost', {
    group = sfgroup,
    pattern = { '*/lwc/*/*.js', '*/lwc/*/*.html', '*/lwc/*/*.css' },
    command = '!sfdx force:source:deploy -p %:h',
})
vim.keymap.set('n', ' stf', ":!sfdx force:apex:test:run --synchronous --classnames %:t:r<cr>")

local function test_function()
    local result = ''
    vim.ui.input({ prompt = 'Enter function: '}, function(input) result = input end)
    vim.cmd('!sfdx force:apex:test:run --synchronous --tests "%:t:r.' .. result .. '"')
end
vim.keymap.set('n', ' stt', function() test_function() end)
