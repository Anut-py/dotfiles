vim.opt.hidden = true
vim.opt.mouse = ""

vim.opt.number = true

vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "auto"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.makeprg = "mingw32-make"

vim.cmd("colorscheme habamax")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

