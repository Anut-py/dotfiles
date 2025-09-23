local wezterm = require("wezterm")

local windows = string.find(vim.loop.os_uname().sysname, "MINGW")
local ext = windows and ".exe" or ""

vim.keymap.set("n", "<localleader>c", function ()
    local path = vim.fn.expand("%:r")
    path = vim.fn.substitute(path, "\\", "/", "g")
    vim.cmd("Make %<")
end, { buffer = true, noremap = true, silent = true })

vim.keymap.set("n", "<localleader>r", function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    wezterm.start_zsh(wezterm.split, wezterm.quick_prog(executable))()
end, { buffer = true, noremap = true, silent = true })

