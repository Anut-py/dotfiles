local wezterm = require("wezterm")

local windows = vim.loop.os_uname().sysname == "Windows_NT"
local ext = windows and ".exe" or ""

vim.opt_local.makeprg = "g++ % -o %:r:S" .. ext

vim.keymap.set('n', '<localleader>r', function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    local dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    vim.cmd("split | term (cd \"" .. dir .. "\" && \"" .. executable .. "\")")
end, { noremap = true, silent = true })

vim.keymap.set('n', '<localleader>R', function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    wezterm.start_cmd(wezterm.split, "set PROG=" .. executable)()
end, { noremap = true, silent = true })

