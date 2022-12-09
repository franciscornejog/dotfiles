local config = {
    directory = '~/3_resources/',
    file_extension = 'md',
}

-- get_template = function(title, body)
--     template = {
--         filename = os.date('%Y%m%d%H%M%S'),
--     }
--     return template
-- end

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

local function search_note()
    local telescope_config = { prompt_title = ' Notes ', cwd = config.directory }
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
vim.keymap.set('n', ' cn', function() create_note() end)
vim.keymap.set('n', ' fn', function() search_note() end)
