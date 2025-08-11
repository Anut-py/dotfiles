return {
    s({trig=";ee", snippetType="autosnippet", wordTrig=false},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {i(1), i(2), rep(1)}
        )
    ),
    s({trig="\\[", snippetType="autosnippet", wordTrig=false},
        fmta(
            [[
                \[ <> \]
            ]],
            {i(1)}
        )
    ),
    s({trig="\\(", snippetType="autosnippet", wordTrig=false},
        fmta(
            [[
                \(<>\)
            ]],
            {i(1)}
        )
    ),
    s({trig="$", snippetType="autosnippet", wordTrig=false},
        fmta(
            [[
                $<>$
            ]],
            {i(1)}
        )
    ),
    s({trig="``", snippetType="autosnippet", wordTrig=false},
        fmta(
            [[
                ``<>''
            ]],
            {i(1)}
        )
    ) 
}
