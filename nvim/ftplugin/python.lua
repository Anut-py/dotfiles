local wezterm = require("wezterm")

vim.keymap.set("n", "<localleader>r", function()
    local source_file = vim.fn.expand("%:p")
    wezterm.start_zsh(wezterm.split, wezterm.quick_prog("python " .. source_file))()
end, { buffer = true, noremap = true, silent = true })

