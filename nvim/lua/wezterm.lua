local wezterm = {}

function wezterm.start_cmd(prefix, suffix)
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

        local prev = vim.opt.messagesopt
        vim.opt.messagesopt = "wait:0,history:500"
        print("Executed command: " .. command)
        vim.opt.messagesopt = prev
    end
end

wezterm.split = 'wezterm cli split-pane --percent 30'
wezterm.spawn = 'wezterm cli spawn'

return wezterm
