;; extends

((argument
   (raw_string_literal
     (raw_string_content) @injection.content))
 (#set! injection.language "sql")
 (#set! injection.include-children)
 (#set! injection.self-contained)
 (#set! priority 200))
