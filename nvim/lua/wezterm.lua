local wezterm = {}

function wezterm.start_cmd(prefix, suffix)
    suffix = suffix and ' && ' .. suffix or ''
    suffix = vim.fn.substitute(suffix, "\\v(\\\\)@<!\"", "\\\"", "g")
    suffix = vim.fn.substitute(suffix, "\\\\", "\\\\\\\\", "g")
    return function()
        local dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
        local command = prefix .. ' --cwd "' .. dir ..
            '" -- bash -i -c "export NVIM_LISTEN_ADDRESS=\'\\' ..
            vim.v.servername .. '\'' .. suffix .. '; exec bash"'
        os.execute(command)
        print("Executed command: " .. command)
    end
end

wezterm.split = 'wezterm cli split-pane --percent 30'
wezterm.spawn = 'wezterm cli spawn'

return wezterm
