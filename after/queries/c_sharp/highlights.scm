;; extends

;; Background for Dapper SQL method first arg
((invocation_expression
   function: (member_access_expression
     name: (identifier) @_method)
   arguments: (argument_list
     .
     (argument
       [(raw_string_literal (raw_string_content) @sql.embedded)
        (string_literal (string_literal_content) @sql.embedded)
        (interpolated_string_expression (string_content) @sql.embedded)])))
 (#any-of? @_method
   "Query" "QueryAsync"
   "QueryFirst" "QueryFirstAsync"
   "QueryFirstOrDefault" "QueryFirstOrDefaultAsync"
   "QuerySingle" "QuerySingleAsync"
   "QuerySingleOrDefault" "QuerySingleOrDefaultAsync"
   "Execute" "ExecuteAsync"
   "ExecuteScalar" "ExecuteScalarAsync"
   "QueryMultiple" "QueryMultipleAsync"))

;; Background for CommandDefinition first arg
((object_creation_expression
   type: (identifier) @_type
   arguments: (argument_list
     .
     (argument
       [(raw_string_literal (raw_string_content) @sql.embedded)
        (string_literal (string_literal_content) @sql.embedded)
        (interpolated_string_expression (string_content) @sql.embedded)])))
 (#eq? @_type "CommandDefinition"))

;; Background for vars named sql/query/command/cmd
((local_declaration_statement
   (variable_declaration
     (variable_declarator
       (identifier) @_name
       [(raw_string_literal (raw_string_content) @sql.embedded)
        (string_literal (string_literal_content) @sql.embedded)
        (interpolated_string_expression (string_content) @sql.embedded)])))
 (#any-of? @_name
   "sql" "Sql" "SQL"
   "query" "Query"
   "command" "Command"
   "cmd" "Cmd"))
