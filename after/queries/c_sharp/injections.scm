;; extends

;; Dapper: first positional arg is SQL (raw or regular string)
((invocation_expression
   function: (member_access_expression
     name: (identifier) @_method)
   arguments: (argument_list
     .
     (argument
       [(raw_string_literal (raw_string_content) @injection.content)
        (string_literal (string_literal_content) @injection.content)
        (interpolated_string_expression (string_content) @injection.content)])))
 (#any-of? @_method
   "Query" "QueryAsync"
   "QueryFirst" "QueryFirstAsync"
   "QueryFirstOrDefault" "QueryFirstOrDefaultAsync"
   "QuerySingle" "QuerySingleAsync"
   "QuerySingleOrDefault" "QuerySingleOrDefaultAsync"
   "Execute" "ExecuteAsync"
   "ExecuteScalar" "ExecuteScalarAsync"
   "QueryMultiple" "QueryMultipleAsync")
 (#set! injection.language "sql")
 (#set! injection.include-children)
 (#set! injection.self-contained))

;; Dapper CommandDefinition: first arg is SQL
((object_creation_expression
   type: (identifier) @_type
   arguments: (argument_list
     .
     (argument
       [(raw_string_literal (raw_string_content) @injection.content)
        (string_literal (string_literal_content) @injection.content)
        (interpolated_string_expression (string_content) @injection.content)])))
 (#eq? @_type "CommandDefinition")
 (#set! injection.language "sql")
 (#set! injection.include-children)
 (#set! injection.self-contained))

;; Local var named sql/query/command/cmd (raw or regular string)
((local_declaration_statement
   (variable_declaration
     (variable_declarator
       (identifier) @_name
       [(raw_string_literal (raw_string_content) @injection.content)
        (string_literal (string_literal_content) @injection.content)
        (interpolated_string_expression (string_content) @injection.content)])))
 (#any-of? @_name
   "sql" "Sql" "SQL"
   "query" "Query"
   "command" "Command"
   "cmd" "Cmd")
 (#set! injection.language "sql")
 (#set! injection.include-children)
 (#set! injection.self-contained))
