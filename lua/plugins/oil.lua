require("oil").setup({
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set('n', '<M-/>', ':Oil %:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-?>', ':Bd | Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-,>', ':split | Oil %:h<CR><C-w>J',
    { noremap = true, silent = true })

