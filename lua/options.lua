vim.opt.hidden = true
vim.opt.number = true
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

vim.cmd('colorscheme habamax')
vim.cmd('helptags ALL')

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.tex_flavor = "latex"

