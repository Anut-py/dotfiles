require("telescope").setup({
    extensions = {
        undo = {
            side_by_side = true,
        },
    },
})
require("telescope").load_extension("undo")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files,
    { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fgf', builtin.git_files,
    { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles,
    { desc = 'Telescope find old files' })

vim.keymap.set('n', '<leader>ft', builtin.treesitter,
    { desc = 'Telescope search treesitter' })
vim.keymap.set('n', '<leader>fll', builtin.loclist,
    { desc = 'Telescope search location list' })

vim.keymap.set('n', '<leader>fgs', builtin.git_status,
    { desc = 'Telescope list git status' })

vim.keymap.set('n', '<leader>flg', builtin.live_grep,
    { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,
    { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>fb', builtin.buffers,
    { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>fr', builtin.resume,
    { desc = 'Telescope resume picker' })
vim.keymap.set('n', '<leader>fp', builtin.builtin,
    { desc = 'Telescope browse pickers' })

vim.keymap.set('n', '<leader>fu', "<cmd>Telescope undo<cr>",
    { desc = 'Telescope browse undo tree' })

