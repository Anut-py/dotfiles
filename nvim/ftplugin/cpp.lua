local wezterm = require("wezterm")

local windows = vim.loop.os_uname().sysname == "Windows_NT"
local ext = windows and ".exe" or ""

vim.opt_local.makeprg = "g++ % -o %:r:S" .. ext

vim.keymap.set('n', '<localleader>r', function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    wezterm.start_cmd(wezterm.split, "export PROG='" .. executable .. "'")()
end, { noremap = true, silent = true })

