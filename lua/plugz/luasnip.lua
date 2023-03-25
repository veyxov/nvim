local M = {
    "L3MON4D3/LuaSnip",
}

M.config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

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
]], { i(1), i(2) }))

    })

    ls.add_snippets("cs", {
        s("fact", fmt([[
[Fact]
public void {}()
{{
    {}
}}
        ]], { i(1, "TestName"), i(2) }))
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

    ls.add_snippets("cs", {
        s("apicontroller", fmt([[
[ApiController]
[Route("{}")]
public class {}Contoller : ControllerBase
{{
    {}
}}
        ]], { i(1, "api"), i(2, "Some"), i(3) }))
    })
end

return M
