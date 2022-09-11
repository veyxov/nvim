(("if" @keyword) (#set! conceal "?"))
(("else" @keyword) (#set! conceal "¿"))

(("using" @keyword) (#set! conceal ""))
(("namespace" @keyword) (#set! conceal "笠"))

(("await" @keyword) (#set! conceal "神"))
(("async" @keyword) (#set! conceal ""))

(("return" @keyword) (#set! conceal ""))
(("break" @keyword) (#set! conceal ""))

(("public" @comment) (#set! conceal ""))
(("private" @keyword) (#set! conceal ""))
(("partial" @keyword) (#set! conceal ""))
(("protected" @keyword) (#set! conceal "ﱾ"))
(("readonly" @keyword) (#set! conceal ""))
(("const" @keyword) (#set! conceal ""))

(("interface" @keyword) (#set! conceal ""))
(("class" @keyword) (#set! conceal "更"))
(("record" @keyword) (#set! conceal ""))
(("struct" @keyword) (#set! conceal "ﰀ"))

(("static" @keyword) (#set! conceal ""))
(("abstract" @keyword) (#set! conceal "擄"))

(("new" @keyword) (#set! conceal ""))
(("get" @keyword) (#set! conceal "ﰵ"))
(("set" @keyword) (#set! conceal "ﰬ"))
(("init" @keyword) (#set! conceal ""))

(("=>" @Conceal) (#set! conceal ""))
(("out" @Conceal) (#set! conceal ""))

(((method_declaration type:(void_keyword) @keyword)) (#set! conceal "ﳠ"))

(("foreach" @keyword) (#set! conceal ""))
(("in" @keyword) (#set! conceal ""))

(((method_declaration type:(generic_name (identifier) @TStag (#eq? @TStag "Task")))) (#set! conceal "ﲆ"))
(((method_declaration type:(generic_name (identifier) @TStag (#eq? @TStag "ErrorOr")))) (#set! conceal ""))

(("var" @keyword) (#set! conceal ""))
(((variable_declaration type:(implicit_type) @variable) (#set! conceal "")))

(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "HttpGet"))))) (#set! conceal ""))
(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "HttpPut"))))) (#set! conceal ""))
(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "HttpPatch"))))) (#set! conceal "璘"))
(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "HttpPost"))))) (#set! conceal "頻"))
(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "HttpDelete"))))) (#set! conceal ""))

(((method_declaration (attribute_list (attribute name:(identifier) @debug (#eq? @debug "Authorize"))))) (#set! conceal ""))
