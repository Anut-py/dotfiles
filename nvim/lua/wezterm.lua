local wezterm = {}

WEZTERM_DEBUG = false

function wezterm.start_zsh(prefix, suffix)
    suffix = suffix and ' && ' .. suffix or ''
    return function()
        local dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
        local command = prefix .. ' --cwd "' .. dir ..
            '" -- zsh -i -c "export NVIM_LISTEN_ADDRESS=\'' ..
            vim.v.servername .. '\'' .. suffix .. '; exec zsh"'
        command = vim.fn.substitute(command, "\\v(\\\\)@<!\"", "\\\"", "g")
        command = vim.fn.substitute(command, "\\\\", "\\\\\\\\", "g")
        command = vim.fn.substitute(command, "oil://", "", "g")
        command = vim.fn.substitute(command, "\"\\zs/C/", "C:/", "g")

        os.execute(command)

        if WEZTERM_DEBUG then
            print("Executed command: " .. command)
        end
    end
end

function wezterm.quick_prog(command)
    return "export QUICK_PROG='" .. command .. "'"
end

wezterm.split = 'wezterm cli split-pane --percent 30'
wezterm.spawn = 'wezterm cli spawn'

return wezterm
