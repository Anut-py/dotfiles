vim.keymap.set('n', '<C-a>', 'o<Esc>')
vim.keymap.set('n', '<C-z>', 'O<Esc>')

function start_cmd(prefix)
    return function()
        local dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
        local command = prefix .. ' --cwd "' .. dir ..
        '" -- cmd /k "set NVIM_LISTEN_ADDRESS=' .. vim.v.servername .. '"'
        os.execute(command)
    end
end

vim.keymap.set('n', '<M-;>', start_cmd('wezterm cli split-pane --percent 30'))
vim.keymap.set('n', '<M-:>', start_cmd('wezterm cli spawn'))

vim.api.nvim_create_user_command("SS", "tabnew | Startify", {})
vim.api.nvim_create_user_command("TT", "Bd | Startify", {})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })

local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(keys) do
    vim.keymap.set({'n', 'i', 'v'}, key, '<Nop>')
end
