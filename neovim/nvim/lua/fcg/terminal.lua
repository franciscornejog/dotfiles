
vim.cmd([[augroup terminalSetup
    autocmd!
    autocmd TermOpen * startinsert             
    autocmd TermOpen * setlocal nonumber       
    autocmd TermOpen * setlocal nospell        
    autocmd BufEnter term://* startinsert      
augroup end]])


-- Insert when open term
-- Remove line number when open term
-- Remove spellcheck when open term
-- Insert when enter term
