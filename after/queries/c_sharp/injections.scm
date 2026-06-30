; Highlight SQL inside C# string literals that look like SQL.
; extends

; Regular: "SELECT ..."
((string_literal (string_literal_content) @injection.content)
 (#match? @injection.content "\\c\\v<(SELECT|INSERT|UPDATE|DELETE|MERGE|CREATE|ALTER|DROP|TRUNCATE|WITH)>")
 (#set! injection.language "sql"))

; Verbatim: @"INSERT ..."
((verbatim_string_literal) @injection.content
 (#match? @injection.content "\\c\\v<(SELECT|INSERT|UPDATE|DELETE|MERGE|CREATE|ALTER|DROP|TRUNCATE|WITH)>")
 (#set! injection.language "sql"))

; Raw: """ ... """
((raw_string_literal (raw_string_content) @injection.content)
 (#match? @injection.content "\\c\\v<(SELECT|INSERT|UPDATE|DELETE|MERGE|CREATE|ALTER|DROP|TRUNCATE|WITH)>")
 (#set! injection.language "sql"))

; Interpolated: $"SELECT {x} ..."  (literal text chunks only)
((interpolated_string_expression (string_content) @injection.content)
 (#match? @injection.content "\\c\\v<(SELECT|INSERT|UPDATE|DELETE|MERGE|CREATE|ALTER|DROP|TRUNCATE|WITH)>")
 (#set! injection.language "sql"))
