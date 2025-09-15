local wezterm = require("wezterm")

vim.keymap.set("n", "<M-;>", wezterm.start_cmd(wezterm.split), { noremap = true, silent = true })
vim.keymap.set("n", "<M-:>", wezterm.start_cmd(wezterm.spawn), { noremap = true, silent = true })

vim.keymap.set("i", "<A-b>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = true, desc = "Spellcheck" })
vim.keymap.set("n", "<A-b>", "mq[s1z=`q", { noremap = true, silent = true, desc = "Spellcheck" })

vim.api.nvim_create_user_command("Q", "mks! | qa", {})
vim.api.nvim_create_user_command("WQ", "w | mks! | qa", {})

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })
vim.keymap.set("n", "<leader>p", "<cmd>normal vipJgqq<CR>", { desc = "Rewrap paragraph" })
vim.keymap.set("n", "<leader>c", function()
    if vim.opt_local.conceallevel:get() == 0 then
        vim.opt_local.conceallevel = 2
    else
        vim.opt_local.conceallevel = 0
    end
end, { desc = "Toggle conceal" })

local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(keys) do
    vim.keymap.set({ "n", "i", "v", "c" }, key, "<Nop>")
end
