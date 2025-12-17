vim.api.nvim_create_user_command("Bd", function ()
    require('mini.bufremove').delete(0, false)
end, {})

require('mini.surround').setup()

require('mini.icons').setup()

local my_i = function(snippet)
    return MiniSnippets.default_insert(
        snippet, { empty_tabstop = '', empty_tabstop_final = '' })
end
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
    snippets = {
        gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
        gen_loader.from_lang(),
    },
    expand = { insert = my_i }
})

require('mini.pick').setup()
require('mini.extra').setup()

vim.keymap.set('n', '<Leader>f<Leader>', ":Pick ", { desc = "Pick pickers" })
vim.keymap.set('n', '<Leader>ff', ":Pick files<CR>", { desc = "Pick files" })
vim.keymap.set('n', '<Leader>fh', ":Pick help<CR>", { desc = "Pick help" })

local buffer_mappings = {
    delete = {
        char = '<C-d>',
        func = function()
            vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
        end
    }
}
vim.keymap.set('n', '<Leader>fb', function()
    MiniPick.builtin.buffers({}, { mappings = buffer_mappings })
end, { desc = "Pick buffers" })

require('mini.git').setup()

vim.keymap.set({ 'n', 'x' }, '<Leader>gl',
    '<Cmd>lua MiniGit.show_at_cursor()<CR>', { desc = 'Show at cursor' })
vim.keymap.set({ 'n', 'x' }, '<Leader>g<Leader>',
    ':Git ', { desc = 'Git command' })
vim.keymap.set({ 'n', 'x' }, '<Leader>gs',
    '<Cmd>Git status<CR>', { desc = 'Git status' })
vim.keymap.set({ 'n', 'x' }, '<Leader>gu',
    '<Cmd>Git restore --staged %<CR>', { desc = 'Unstage file' })

require('mini.diff').setup()

vim.keymap.set({ 'n', 'x' }, '<Leader>go', require('mini.diff').toggle_overlay,
    { desc = 'Toggle overlay' })

require('mini.comment').setup()
require('mini.ai').setup()
require('mini.jump2d').setup()
