local wezterm = require('wezterm')

vim.keymap.set('n', '<M-;>', wezterm.start_cmd(wezterm.split))
vim.keymap.set('n', '<M-:>', wezterm.start_cmd(wezterm.spawn))

vim.api.nvim_create_user_command("Q", "mks! | qa", {})
vim.api.nvim_create_user_command("WQ", "w | mks! | qa", {})

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })

local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(keys) do
    vim.keymap.set({'n', 'i', 'v'}, key, '<Nop>')
end
