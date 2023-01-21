local M = {
    "L3MON4D3/LuaSnip",
}

M.config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")
    local extras = require("luasnip.extras")
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local conds = require("luasnip.extras.expand_conditions")
    local postfix = require("luasnip.extras.postfix").postfix
    local types = require("luasnip.util.types")
    local parse = require("luasnip.util.parser").parse_snippet

    ls.add_snippets("all", {
        s("ternary", {
            -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
            i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
        })
    })

    ------------------------
    ls.add_snippets("lua", {


        s("module", fmt(
            [[local M = {{
    {}
}}

M.config = function()
    {}
end

return M
]]           , { i(1), i(2) }))

    })

    ls.add_snippets("cs", {
        s("rt", fmt([[public {} {} {{ get; set; }}

        ]], { i(1, "string"), i(2, "MyProperty") }))
    })

    ls.add_snippets("cs", {
        s("class", fmt([[public class {} {{
    {}
}}]], { i(1, "MyClass"), i(2) }))
    })

    ls.add_snippets("cs", {
        s("record", fmt([[public record {}({});]], { i(1, "MyRecord"), i(2, "string") }))
    })

    --ls.add_snippets("cs", {
    --s("class", fmt([[public class {}]], {i(1, "MyClass")}))
    --})
    ------------------------
end

return M
