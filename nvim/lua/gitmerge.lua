vim.api.nvim_create_autocmd("UIEnter", {
    callback = function(_)
        -- Git mergetool
        if vim.opt_local.diff:get() and #vim.api.nvim_list_bufs() == 4 then
            local bufs = {
                l = 1,
                b = 2,
                r = 3,
                a = 4
            }
            local wins = {
                l = 1002,
                b = 1003,
                r = 1001,
                a = 1000
            }

            vim.api.nvim_set_option_value("diff", false, { win = wins.a })
            vim.api.nvim_win_close(wins.a, false)
            vim.api.nvim_set_option_value("diff", false, { win = wins.l })
            vim.api.nvim_win_close(wins.l, false)

            vim.cmd.tabnew()
            local bnew = vim.api.nvim_get_current_win()
            vim.api.nvim_set_current_buf(bufs.b)
            vim.api.nvim_set_option_value("diff", true, { win = bnew })

            vim.cmd.vsplit()
            local lnew = vim.api.nvim_get_current_win()
            vim.api.nvim_set_current_buf(bufs.l)
            vim.api.nvim_set_option_value("diff", true, { win = lnew })

            vim.api.nvim_set_current_win(bnew)

            vim.keymap.set("n", "do", function()
                vim.o.operatorfunc = "v:lua.DoRange"
                return "g@"
            end, { expr = true })

            vim.keymap.set("n", "dp", function()
                vim.o.operatorfunc = "v:lua.DpRange"
                return "g@"
            end, { expr = true })

            vim.keymap.set("n", "dogh", "<cmd>diffget<cr>", { noremap = true, silent = true })
            vim.keymap.set("n", "dpgh", "<cmd>diffput<cr>", { noremap = true, silent = true })

            vim.keymap.set("n", "doo", "<cmd>.diffget<cr>", { noremap = true, silent = true })
            vim.keymap.set("n", "dodo", "<cmd>.diffget<cr>", { noremap = true, silent = true })
            vim.keymap.set("n", "dpp", "<cmd>.diffput<cr>", { noremap = true, silent = true })
            vim.keymap.set("n", "dpdp", "<cmd>.diffput<cr>", { noremap = true, silent = true })

            local function range(op)
                return function (_)
                    local _, start_line, _, _ = unpack(vim.fn.getpos("'["))
                    local _, end_line, _, _ = unpack(vim.fn.getpos("']"))

                    vim.cmd(string.format("%d,%d" .. op, start_line, end_line))
                end
            end

            DoRange = range("diffget")
            DpRange = range("diffput")

            vim.keymap.set("v", "do", ":diffget<cr>", { noremap = true, silent = true })

            vim.keymap.set("v", "dp", ":diffput<cr>", { noremap = true, silent = true })

            vim.keymap.set("n", "<leader>m", function ()
                local lines = vim.api.nvim_buf_get_lines(bufs.b, 0, -1, false)
                vim.api.nvim_buf_set_lines(bufs.a, 0, -1, false, lines)
                vim.api.nvim_buf_call(bufs.a, function() vim.cmd("w | qa!") end)
            end, { desc = "Finish merge", noremap = true, silent = true })

            vim.keymap.set("n", "<leader>t", function ()
                if vim.opt_local.diff:get() then
                    vim.opt_local.diff = false
                else
                    vim.opt_local.diff = true
                end
            end, { desc = "Toggle diff", noremap = true, silent = true })
        end
    end,
})

