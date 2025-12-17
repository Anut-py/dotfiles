local wezterm = require("wezterm")

local windows = string.find(vim.loop.os_uname().sysname, "MINGW")
local ext = windows and ".exe" or ""

vim.keymap.set("n", "<localleader>c", function ()
    local path = vim.fn.expand("%:r")
    path = vim.fn.substitute(path, "\\\\", "/", "g")
    vim.cmd("Make " .. path)
end, { buffer = true, noremap = true, silent = true })

vim.keymap.set("n", "<localleader>r", function()
    local executable = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":r") .. ext
    wezterm.start_zsh(wezterm.split, wezterm.quick_prog(executable))()
end, { buffer = true, noremap = true, silent = true })

vim.keymap.set("n", "<localleader>ps", "\"+PgcGgggqgcGo<C-u>starter<C-j>", {
    buffer = true,
    remap = true,
    silent = true,
    desc = "Paste problem statement as comment and expand starter snippet"
})

local snippets = require("snippets")
snippets.def_snip("rr", "$1.begin(), $1.end()", true)
snippets.def_snip("co", "cout << $1 << endl;", true)

