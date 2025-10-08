local plover = {
    enable = false
}

function plover.resume(callback)
    vim.system({ "plover_send_command", "resume" }, callback)
end

function plover.suspend(callback)
    vim.system({ "plover_send_command", "suspend" }, callback)
end

function plover.setup()
    plover.suspend()

    vim.keymap.set("n", "<leader>p", function()
        plover.enable = not plover.enable
        if plover.enable then
            print("Plover enabled")
        else
            print("Plover disabled")
        end
        vim.api.nvim__redraw({ statusline = true })
    end, {})

    vim.api.nvim_create_autocmd("InsertEnter", {
        pattern = "*",
        callback = function()
            if plover.enable then
                plover.resume()
            end
        end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
        pattern = "*",
        callback = function()
            if plover.enable then
                plover.suspend(function()
                    print("Plover off")
                end)
            end
        end,
    })

    vim.o.statusline = table.concat({
        "%f",
        " %m",
        " %=",
        "%{v:lua.PloverStatus()}",
        " %y %p%% %l:%c",
    })

    function _G.PloverStatus()
        if plover.enable then
            return "[Plover]"
        else
            return ""
        end
    end
end

return plover
