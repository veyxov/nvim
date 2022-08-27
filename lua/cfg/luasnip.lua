local ls = require"luasnip"

local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local f = ls.function_node

local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep

ls.snippets = {

    cs = {
        s('prop',
        fmt("public {} {} {{ get; set; }}\n{}", { i(1, "string"), i(2, "Name"), i(0) })),

        s('class',
        fmt(
        [[
        public class {}
        {{
            {}
        }}
        ]], { i(1, "name"), i(0) } )),

    }
}

ls.add_snippets("cs", {
        s('api',
            fmt(
                [[
                    [Http{}("{}")]
                    public async Task<IActionResult> {}Async()
                    {{
                        {}
                        return Ok();
                    }}
                ]],
            { i(1, "Get"), i(2, "Test"), rep(2), i(0) }
            )
        ),
})

ls.add_snippets("cs", {
        s('test',
            fmt(
                [[
                    [Fact]
                    public async Task {}()
                    {{
                        // Arrange
                        {}
                        // Act
                        {}
                        // Assert
                        {}
                    }}
                ]],
            { i(1, "TestName"), i(2, ""), i(3, ""), i(4, "") }
            )
        ),
})

ls.add_snippets("cs", {
        s('class',
            fmt(
                [[
                public class {}
                {{
                    {}
                }}
                ]],
            { i(1, "Name"), i(2, "") }
            )
        ),
})

ls.add_snippets("cs", {
        s('prop',
            fmt(
                [[
                public {} {} {{ get; set; }}
                {}
                ]],
            { i(1, "string"), i(2, "Name"), i(0) }
            )
        ),
})

ls.add_snippets("cs", {
        s('mediator',
            fmt(
                [[
                var command = new {}Command({});
                var handler = new {}CommandHandler({});

                var result = await handler.Handle(command, CancelationToken.None);
                {}
                ]],
            { i(1, "Name"), i(2), rep(1), i(3), i(0) }
            )
        ),
})

ls.add_snippets("cs", {
        s('handler',
            fmt(
                [[
                public record {}Command({}) : IRequest<{}>;

                public class {}CommandHandler : IRequestHandler<{}Command, {}>
                {{
                    public {}CommandHandler({})
                    {{
                    }}

                    public async Task<{}> Handle({}Command request, CancellationToken cancelationToken)
                    {{
                        {}
                    }}
                }}
                ]],
            { i(1, "Name"), i(2), i(3), rep(1), rep(1), rep(3), rep(1), i(4), rep(3), rep(1), i(0) }
            )
        ),
})

ls.add_snippets("cs", {
        s('validator',
            fmt(
                [[
                public class {}Validator : AbstractValidator<{}Command>
                {{
                    public {}Validator()
                    {{
                        {}
                    }}
                }}
                ]],
            { i(1, "Name"), rep(1), rep(1), i(0) }
            )
        ),
})

ls.add_snippets("cs", {
        s('interface',
            fmt(
                [[
                public interface I{}
                {{
                    {}
                }}
                ]],
                { i(1, "Name"), i(0) }
                )
        ),
})

ls.add_snippets("cs", {
        s('di',
            fmt(
                [[
                services.AddTransient<I{}, {}>();
                ]],
                { i(1, "Service"), rep(1) }
                )
        ),
})

ls.add_snippets("cs", {
        s('summary',
            fmt(
                [[
                /// <summary>
                /// {}
                /// </summary>
                ]],
                { i(0) }
                )
        ),
})

ls.add_snippets("cs", {
        s('response',
            fmt(
                [[
                /// <response code="{}">
                /// {}
                /// </response>
                {}
                ]],
                { i(1, "200"), i(2), i(0) }
                )
        ),
})

ls.add_snippets("cs", {
        s('func',
            fmt(
                [[
                public {} Task {}({})
                {{
                    {}
                }}
                ]],
                { c(1, { t "async", t ""}), i(2, "MethodName"), i(3), i(0) }
                )
        ),
})

-- Generate constructor
ls.add_snippets("cs", {
        s('ctor',
            fmt(
                [[
                public {}()
                {{

                }}
                ]],
                { f(function(args) return GetClassName() end)}
                )
        ),
})
