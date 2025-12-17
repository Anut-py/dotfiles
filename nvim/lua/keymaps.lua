local wezterm = require("wezterm")

vim.g.mapleader = " "

vim.keymap.set("n", "<M-;>", wezterm.start_zsh(wezterm.split), { noremap = true, silent = true })
vim.keymap.set("n", "<M-:>", wezterm.start_zsh(wezterm.spawn), { noremap = true, silent = true })

vim.keymap.set("i", "<A-b>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = true, desc = "Spellcheck" })
vim.keymap.set("n", "<A-b>", "mq[s1z=`q", { noremap = true, silent = true, desc = "Spellcheck" })

vim.api.nvim_create_user_command("Q", "mks! | qa", {})
vim.api.nvim_create_user_command("WQ", "w | mks! | qa", {})

vim.keymap.set("n", "<leader>yy", "<cmd>%y+<cr>", { noremap = true, silent = true, desc = "Copy file to clipboard" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
    { desc = "List diagnostics" })
vim.keymap.set("n", "<leader>c", function()
    if vim.opt_local.conceallevel:get() == 0 then
        vim.opt_local.conceallevel = 2
        print("Conceal on")
    else
        vim.opt_local.conceallevel = 0
        print("Conceal off")
    end
end, { desc = "Toggle conceal" })

vim.keymap.set("n", "<leader>s", function()
    if vim.opt_local.spell:get() then
        vim.opt_local.spell = false
        print("Spellcheck off")
    else
        vim.opt_local.spell = true
        print("Spellcheck on")
    end
end, { desc = "Toggle spellcheck" })

vim.keymap.set("n", "<leader>z", function()
    if vim.fn.winnr('$') == 1 and vim.fn.tabpagenr('$') > 1 then
        vim.cmd("tabclose")
    else
        vim.cmd("tab split")
    end
end, { desc = "Toggle zoom window" })

vim.keymap.set("n", "<leader>td", "<cmd>grep -i -w todo<cr>")

for _, mode in ipairs({ "i", "n" }) do
    vim.keymap.set(mode, "<A-i>", function()
        if vim.opt.autocomplete:get() then
            vim.opt.autocomplete = false
            if mode == "i" then
                vim.api.nvim_feedkeys(vim.keycode("<C-e>"), "i", false)
            end
            print("Autocomplete off")
        else
            vim.opt.autocomplete = true
            if mode == "i" then
                vim.api.nvim_feedkeys(vim.keycode("<C-n>"), "i", false)
            end
            print("Autocomplete on")
        end
    end, { desc = "Toggle autocomplete" })
end

local keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
for _, key in ipairs(keys) do
    vim.keymap.set({ "n", "i", "v", "c" }, key, "<Nop>")
end

vim.keymap.set("i", "<C-h>", "<C-w>")
