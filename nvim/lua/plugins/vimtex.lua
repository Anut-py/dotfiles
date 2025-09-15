vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_indent_lists = {}
vim.g.tex_flavor = "latex"

vim.g.vimtex_imaps_leader = ""
vim.fn['vimtex#imaps#add_map']({ lhs = "jm", rhs = [[\implies]] })
vim.fn['vimtex#imaps#add_map']({ lhs = "jf", rhs = [[\iff]] })
vim.fn['vimtex#imaps#add_map']({ lhs = "ff", rhs = [[\frac]] })

