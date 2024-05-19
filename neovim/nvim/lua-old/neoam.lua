local config = {
    directory = os.getenv('HOME') .. '/3_resources/',
    file_extension = 'md',
}

local function get_input()
    local result = ''
    vim.ui.input({ prompt = 'File: ' }, function(input) result = input end)
    return result
end

local function get_filename(title)
    local filename = ''
    if title ~= nil then
        local id = os.date('%Y%m%d%H%M%S')
        local name = string.lower(title)
        name = string.gsub(name, '%s', '-')
        filename = id .. '-' .. name .. '.' .. config.file_extension
    end
    return filename
end

local function get_metadata(title)
    local template = '---\ntitle: %s\ndate: %s\n---'
    local date = os.date('%Y-%m-%d')
    local metadata = string.format(template, title, date)
    return metadata
end

local function get_title(filename)
    local path = config.directory .. filename
    local file = io.open(path)
    local get_lines = nil
    if (file ~= nil) then get_lines = file:lines() end
    get_lines()
    local second_line = get_lines()
    local title = string.sub(second_line, 8, -1)
    io.close(file)
    return title
end

local function search_note()
    local telescope_config = { prompt_title = 'Notes', cwd = config.directory }
    require('telescope.builtin').find_files(telescope_config)
end

local function insert_note()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local bufnr = vim.api.nvim_get_current_buf()
    local telescope_config = {
        prompt_title = 'Notes',
        cwd = config.directory,
        attach_mappings = function(_, map)
            map("i", "<cr>", function(prompt_bufnr)
                local entry = require("telescope.actions.state").get_selected_entry()
                local filename = entry[1]
                local title = get_title(filename)
                local link = '[' .. title .. '](' .. filename .. ')'
                local row = cursor[1] - 1
                local col = cursor[2]
                vim.api.nvim_buf_set_text(bufnr, row, col, row, col, { link })
                require("telescope.actions").close(prompt_bufnr)
            end)
            return true
        end,
    }
    require('telescope.builtin').find_files(telescope_config)
end

local function create_note()
    local title = get_input()
    local filename = get_filename(title)
    local metadata = get_metadata(title)
    local file = io.open(filename, 'w')
    if (file ~= nil) then file:write(metadata) end
    if (file ~= nil) then file:close() end
    vim.cmd.edit(filename)
    return filename
end

-- vim.keymap.set('n', ' tr', ":lua require('plenary.reload').reload_module('neoam')<cr>")
vim.keymap.set('n', ' nc', function() create_note() end)
vim.keymap.set('n', ' fn', function() search_note() end)
vim.keymap.set('n', ' ni', function() insert_note() end)
vim.keymap.set('n', ' nn', ':edit ' .. config.directory .. '<cr>')
