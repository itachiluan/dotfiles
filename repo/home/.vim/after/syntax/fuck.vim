setlocal iskeyword+=+
setlocal iskeyword+=-
setlocal iskeyword+=*

syn case ignore
syn keyword fkBool fkBool
syn keyword fkOperator * +
syn keyword fkComment aha

syntax match fkIdentifier /\<\l\+\>/
syntax match fkComment /\/\/.*/

hi def link fkBool                    Statement
hi def link fkOperator                Operator
hi def link fkComment                 Comment
hi def link fkIdentifier              String

let b:current_syntax = "fuck"
