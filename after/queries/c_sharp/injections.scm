;; extends

;; SQL syntax highlighting for Dapper raw string queries
((argument
   (raw_string_literal
     (raw_string_content) @injection.content))
 (#set! injection.language "sql")
 (#set! injection.include-children)
 (#set! injection.self-contained))   ; helps with large multi-line strings
