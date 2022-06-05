local M = {}

local test_result = function()
    local lines = {}
    local cmd = vim.api.nvim_exec("!./vendor/bin/phpunit", true)

    for line in cmd:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    return lines
end

local function map_window_close_keys(buffer)
    local bufClosingKeys = {"<Esc>", "<CR>", "<Leader>"}

    for _, key in ipairs(bufClosingKeys) do
        vim.api.nvim_buf_set_keymap(
            buffer,
            "n",
            key,
            ":close<CR>",
            {
                silent=true,
                nowait=true,
                noremap=true
            }
        )
    end
end

local options = {
    relative = "win",
    width = 120,
    height = 20,
    style = "minimal",
    win = 1001,
    row = 20,
    col = 20
}

M.run_tests = function()
    local buffer = vim.api.nvim_create_buf(false, true)

    map_window_close_keys(buffer)
    vim.api.nvim_open_win(buffer, true, options)
    vim.api.nvim_buf_set_lines(buffer, 2, 2, false, test_result())
end

return M
