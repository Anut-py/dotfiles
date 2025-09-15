local oil = require("oil")

oil.setup({
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set('n', '<M-/>', oil.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<M-?>', function ()
    oil.open_float(vim.fn.getcwd())
end, { noremap = true, silent = true })

