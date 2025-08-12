-- local ts = require("nvim-treesitter")
-- ts.setup()
-- ts.install({"c", "cpp"})
require("nvim-treesitter.configs").setup ({
  ensure_installed = {"c", "cpp"},
  highlight = { enable = true },
})
