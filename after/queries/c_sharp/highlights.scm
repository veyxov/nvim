(("if" @keyword) (#set! conceal "?"))
(("using" @keyword) (#set! conceal ""))
(("namespace" @keyword) (#set! conceal "笠"))
(("else" @keyword) (#set! conceal "¿"))
(("await" @keyword) (#set! conceal "神"))
(("return" @keyword) (#set! conceal ""))
(("break" @keyword) (#set! conceal ""))
(("new" @keyword) (#set! conceal ""))
(("foreach" @keyword) (#set! conceal ""))
(((method_declaration type:(generic_name (identifier) @iden (#eq? @iden "Task")))) (#set! conceal "ﲆ"))

(((variable_declaration type:(implicit_type) @variable) (#set! conceal "")))
