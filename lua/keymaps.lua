vim.keymap.set('n', '<C-a>', 'o<Esc>')
vim.keymap.set('n', '<C-z>', 'O<Esc>')

vim.api.nvim_create_user_command("SS", "tabnew | Startify", {})
vim.api.nvim_create_user_command("TT", "Bd | Startify", {})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })

