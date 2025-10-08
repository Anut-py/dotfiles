local function latex_fmt()
    local conf_home = vim.env.XDG_CONFIG_HOME
    local cmd = "latexindent -m -l=" .. conf_home .. "/latexindent.yaml -"

    local job_id = vim.system({"latexindent", "-m", "-l=" .. conf_home .. "/latexindent.yaml", "-"}, {
        text = true,
        stdin = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    }, function(obj)
            if obj.code == 0 then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.split(obj.stdout, "\n", true))
                end)
            else
                print("latexindent failed with exit code: " .. obj.code)
            end
        end)
end

vim.keymap.set("n", "<localleader>lf", latex_fmt, { buffer = true })

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_indent_lists = {}
vim.g.tex_flavor = "latex"

vim.g.vimtex_imaps_leader = "'"
vim.fn['vimtex#imaps#add_map']({ lhs = "jm", rhs = [[\implies]] })
vim.fn['vimtex#imaps#add_map']({ lhs = "jf", rhs = [[\iff]] })
vim.fn['vimtex#imaps#add_map']({ lhs = "ff", rhs = [[\frac]] })
vim.fn['vimtex#imaps#add_map']({
    lhs = "i",
    rhs = [[\item]],
    context = { { envs = { "itemize", "enumerate" }, rhs = [[\item]] } },
    wrapper = 'vimtex#imaps#wrap_environment'
})

local snippets = require("snippets")
snippets.def_snip("ee", "\\begin{$1}\n\t$0\n\\end{$1}", true)
snippets.def_snip("bf", [[\textbf{$1}]], true)
snippets.def_snip("it", [[\textit{$1}]], true)
snippets.def_snip("im", [[\$$1\$]], true)
snippets.def_snip("iim", [[\\($1\\)]], true)
snippets.def_snip("dm", "\\\\[\n\t$1\n\\\\]", true)
snippets.def_snip("ddm", "\\\\[ $1 \\\\]", true)
snippets.def_snip(",q", "``$1''", true)
snippets.def_snip(",f", [[\frac{$1}{$2}]], true)
snippets.def_snip(",s", [[\sqrt{$1}]], true)
snippets.def_abb(",a", "\\angle ", true)
snippets.def_abb(",d", "\\measuredangle ", true)

vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventInitPost",
    callback = function()
        for i = 97, 97 + 25 do
            local c = string.char(i)
            local u = string.upper(c)
            snippets.def_abb(";" .. c, "$" .. c .. "$", true)
            snippets.def_abb(";" .. u, "$" .. u .. "$", true)
            snippets.def_abb("." .. c, "_" .. c, true)
            snippets.def_abb("." .. u, "_" .. u, true)
        end

        for i = 0, 9 do
            snippets.def_abb("." .. tostring(i), "_" .. tostring(i), true)
            snippets.def_abb("/" .. tostring(i), "^" .. tostring(i), true)
        end

        local maps = {}
        for _, m in ipairs(vim.b.vimtex_imaps) do
            if m["leader"] == nil then
                maps[m["lhs"]] = m["rhs"]
            end
        end
        for i = 97, 97 + 25 do
            local c = string.char(i)
            local u = string.upper(c)
            if maps[c] ~= nil then
                snippets.def_abb("'" .. c, "$" .. vim.api.nvim_eval(maps[c]) .. "$", true)
            end
            if maps[u] ~= nil then
                snippets.def_abb("'" .. u, "$" .. vim.api.nvim_eval(maps[u]) .. "$", true)
            end
        end
    end,
})
