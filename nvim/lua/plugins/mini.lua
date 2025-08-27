vim.api.nvim_create_user_command("Bd", function ()
    require('mini.bufremove').delete(0, false)
end, {})

require('mini.surround').setup()

require('mini.icons').setup()

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
    gen_loader.from_lang(),
  },
})

require('mini.completion').setup({
    lsp_completion = { source_func = 'omnifunc', auto_setup = false }
})

local on_attach = function(args)
  vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end
vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

vim.opt.completeopt = "menuone,noinsert,fuzzy"

require('mini.pick').setup()
require('mini.extra').setup()

vim.keymap.set('n', '<leader>f', ":Pick ", {})

