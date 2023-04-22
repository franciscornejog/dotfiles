-- Stop if a compiler is already chosen
if vim.b.current_compiler ~= nil then
  return
end
vim.b.current_compiler = 'js_node'

vim.o.makeprg = 'node %'
vim.opt.errorformat = {
    '%AError: %m',
    '%AEvalError: %m',
    '%ARangeError: %m',
    '%AReferenceError: %m,%C',
    '%ASyntaxError: %m',
    '%ATypeError: %m',
    '%Z%*[ ]at %f:%l:%c',
    '%Z%*[ ]%m (%f:%l:%c)',
    '%*[ ]%m (%f:%l:%c)',
    '%*[ ]at %f:%l:%c',
    '%Z%p^,%A%f:%l,%C%m',
    '%-G%.%#'
}
-- ReferenceError: Dollar is not defined
--     at Object.<anonymous> (/Users/neuan/1_projects/tdd-project/js/test_money.js:3:13)
--     at Module._compile (node:internal/modules/cjs/loader:1275:14)
--     at Module._extensions..js (node:internal/modules/cjs/loader:1329:10)
--     at Module.load (node:internal/modules/cjs/loader:1133:32)
--     at Module._load (node:internal/modules/cjs/loader:972:12)
--     at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:83:12)
--     at node:internal/main/run_main_module:23:47
