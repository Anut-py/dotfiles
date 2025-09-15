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

require('mini.completion').setup({
    lsp_completion = { source_func = 'omnifunc', auto_setup = false }
})

local on_attach = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

vim.opt.completeopt = "menuone,noinsert,fuzzy"

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})

require('mini.pick').setup()
require('mini.extra').setup()

vim.keymap.set('n', '<Leader><Leader>f', ":Pick ", {desc = "Pick pickers"})
vim.keymap.set('n', '<Leader>ff', ":Pick files<CR>", {desc = "Pick files"})
vim.keymap.set('n', '<Leader>fh', ":Pick help<CR>", { desc = "Pick help" })

local buffer_mappings = {
    delete = {
        char = '<C-d>',
        func = function()
            vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
        end
    }
}
vim.keymap.set('n', '<Leader>fb', function ()
    MiniPick.builtin.buffers({}, { mappings = buffer_mappings })
end, {desc = "Pick buffers"})

require('mini.git').setup()

vim.keymap.set({ 'n', 'x' }, '<Leader>gl',
    '<Cmd>lua MiniGit.show_at_cursor()<CR>', { desc = 'Show at cursor' })
vim.keymap.set({ 'n', 'x' }, '<Leader><Leader>g',
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

