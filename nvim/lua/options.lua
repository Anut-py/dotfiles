vim.opt.mouse = ""

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes:1"

vim.opt.foldmethod = "indent"
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.lsp.foldexpr()"
  end
})
vim.api.nvim_create_autocmd("LspDetach", {
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end
})
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"

vim.opt.nrformats:append("alpha")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.conceallevel = 0
vim.opt.concealcursor = "nc"

vim.opt.scrolloff = 8

vim.opt.spell = false
vim.opt.spelllang = "en_us"

-- Force MSYS stuff on Windows
vim.opt.sh = "zsh"
vim.opt.shcf = "-c"
vim.opt.shq = ""
vim.opt.sxq = ""
vim.opt.ssl = true
vim.opt.ffs = "unix,dos"

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})

