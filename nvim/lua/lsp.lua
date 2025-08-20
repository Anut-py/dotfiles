local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("clangd", {
    cmd = {"clangd"},
    filetypes = {"c", "c++", "cpp"},
    capabilities = capabilities
})
vim.lsp.enable("clangd")

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

