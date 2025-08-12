vim.lsp.config("clangd", {
    cmd = {"clangd"},
    filetypes = {"c", "c++", "cpp"}
})
vim.lsp.enable("clangd")

