vim.opt_local.makeprg = "cabal build -j"
vim.keymap.set("n", "<localleader>c", "<cmd>Make<cr>", { buffer = true, noremap = true, silent = true })

