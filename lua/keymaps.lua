vim.keymap.set('n', '<C-a>', 'o<Esc>')
vim.keymap.set('n', '<C-z>', 'O<Esc>')

vim.keymap.set('n', '<M-/>', ':Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-?>', ':Bd | Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-,>', ':split | Oil %:h<CR><C-w>J',
    { noremap = true, silent = true })

vim.api.nvim_create_user_command("SS", "tabnew | Startify", {})
vim.api.nvim_create_user_command("TT", "Bd | Startify", {})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })

