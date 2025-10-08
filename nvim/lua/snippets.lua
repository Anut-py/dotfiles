local tr = {}
local sl = ";"

function tr.def_snip(trig, snip, buf)
    vim.keymap.set("i", sl .. trig, function()
        vim.snippet.expand(snip)
    end, {buffer = not not buf})
    local fc = string.sub(snip, 1, 1)
    if fc ~= string.upper(fc) then
        local tfc = string.sub(trig, 1, 1)
        vim.keymap.set("i", sl .. string.upper(tfc) .. string.sub(trig, 2), function()
            vim.snippet.expand(string.upper(fc) .. string.sub(snip, 2))
        end, {buffer = not not buf})
        vim.keymap.set("i", sl .. string.upper(trig), function()
            vim.snippet.expand(string.upper(fc) .. string.sub(snip, 2))
        end, {buffer = not not buf})
    end
end

function tr.def_abb(trig, full, buf)
    vim.keymap.set("i", sl .. trig, full, {buffer = not not buf})
    local fc = string.sub(full, 1, 1)
    if fc ~= string.upper(fc) then
        local tfc = string.sub(trig, 1, 1)
        vim.keymap.set("i",
            sl .. string.upper(tfc) .. string.sub(trig, 2),
            string.upper(fc) .. string.sub(full, 2), {buffer = not not buf})
        vim.keymap.set("i",
            sl .. string.upper(trig),
            string.upper(fc) .. string.sub(full, 2), {buffer = not not buf})
    end
end

function tr.setup()
    tr.def_snip("ll", "let $1 be $2.")
    tr.def_snip("ss", "suppose $1.")
    tr.def_snip("sc", "Suppose, for the sake of contradiction, that $1.")
    tr.def_snip("swl", "Suppose, without loss of generality, that $1.")
    tr.def_snip("wc", "we claim that $1.")
    tr.def_snip("bb", "by $1, $2.")
    tr.def_snip("nt", "note that $1.")

    tr.def_abb("loe", "Linearity of Expectation")
    tr.def_abb("loc", "Law of Cosines")
    tr.def_abb("crt", "Chinese Remainder Theorem")
    tr.def_abb("nte", "Euler's Theorem")
    tr.def_abb("inm", "Muirhead's")
    tr.def_abb("alv", "Vieta's")
    tr.def_abb("pp", "Power of a Point")
    tr.def_abb("sym", "Symmetry")
    tr.def_abb("par", "parallel")
    tr.def_abb("per", "perpendicular")

    tr.def_abb("ind", "We proceed by induction. ")
    tr.def_abb("wd", "we denote ")
    tr.def_abb("wf", "we define ")
    tr.def_abb("wh", "we have ")
    tr.def_abb("wmh", "we must have ")
    tr.def_abb("po", "the probability of ")
    tr.def_abb("pt", "the probability that ")
    tr.def_abb("wr", "with respect to ")

    tr.def_abb("t1", "Then, ")
    tr.def_abb("t2", "Therefore, ")
    tr.def_abb("t3", "Thus, ")
    tr.def_abb("a1", "Also, ")
    tr.def_abb("a2", "Additionally, ")
    tr.def_abb("a3", "Furthermore, ")

    vim.keymap.set({ "i", "s" }, "<A-l>", function()
        if vim.snippet.active({ direction = 1 }) then
            return "<Cmd>lua vim.snippet.jump(1)<CR>"
        else
            return "\27l"
        end
    end, { expr = true, silent = true })
    vim.keymap.set({ "i", "s" }, "<A-h>", function()
        if vim.snippet.active({ direction = 1 }) then
            return "<Cmd>lua vim.snippet.jump(-1)<CR>"
        else
            return "\27h"
        end
    end, { expr = true, silent = true })
end

return tr
