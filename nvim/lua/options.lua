vim.opt.mouse = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes:2"

vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "auto"
vim.opt.foldlevelstart = 99

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true

vim.opt.conceallevel = 2

vim.opt.scrolloff = 8

-- Force MSYS stuff on Windows
vim.opt.makeprg = "make"
vim.opt.sh = "zsh"
vim.opt.shcf = "-c"
vim.opt.shq = ""
vim.opt.sxq = ""
vim.opt.ssl = true
vim.opt.ffs = "unix,dos"

vim.cmd("colorscheme catppuccin-mocha")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})

