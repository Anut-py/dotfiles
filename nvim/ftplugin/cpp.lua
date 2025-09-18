local wezterm = require("wezterm")

local windows = string.find(vim.loop.os_uname().sysname, "MINGW")
local ext = windows and ".exe" or ""

vim.keymap.set("n", "<localleader>c", "<cmd>!g++ '%' -o %:r:S" .. ext .. "<cr>",
    { noremap = true, silent = true })

vim.keymap.set("n", "<localleader>r", function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    wezterm.start_cmd(wezterm.split, "export PROG='" .. executable .. "'")()
end, { noremap = true, silent = true })

