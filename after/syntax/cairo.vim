" Vim syntax file
" Language:     Cairo
" Maintainer:   0xHyoga (0xhyoga@gmx.com)
" URL:          

" Quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif


let b:current_syntax = "cairo"

" Comments
syn match     cairoCommentLine         /#[^\n]*\n/
hi def link   cairoCommentLine         Comment

" Functions
syn keyword   cairoKeywordFunc         func nextgroup=cairoFuncName skipwhite
hi def link   cairoKeywordFunc         Keyword

syn match     cairoDirective           /\v\%lang starknet/
hi def link   cairoDirective           Keyword

syn match     cairoFuncName            /\zs[a-zA-Z_][a-zA-Z0-9_]*\ze\s*{/
syn match     cairoFuncName            /\zs[a-zA-Z_][a-zA-Z0-9_]*\ze\s*(/
hi def link   cairoFuncName            Function

syn match     cairoEntityFuncName      /\v[a-zA-Z_][a-zA-Z0-9_]*:/ skipwhite
hi def link   cairoEntityFuncName      Function

" Keywords
syn keyword   cairoKeywordMeta         const let local tempvar felt as static_assert assert member cast alloc_locals
hi def link   cairoKeywordMeta         Keyword

" Special
syn keyword   cairoKeywordSpecial      SIZEOF_LOCALS SIZE return error_message from import 
hi def link   cairoKeywordSpecial      Special

" Keyword
syn keyword   cairoKeywordControlElse  else
syn keyword   cairoKeywordOpcode       call jmp ret abs rel if
hi def link   cairoKeywordOpcode       Keyword
hi def link   cairoKeywordControlElse  Keyword

" Register
syn keyword   cairoKeywordRegister     ap fp
hi def link   cairoKeywordRegister     Identifier

" Operators
" syn match     cairoOperator            '\v\!'
syn match     cairoOperator            '\v\|'
syn match     cairoOperator            '\v\&'
syn match     cairoOperator            '\v\~'
syn match     cairoOperator            '\v\^'
syn match     cairoOperator            '\v\*'
syn match     cairoOperator            '\v/'
syn match     cairoOperator            '\v\+'
syn match     cairoOperator            '\v-'
syn match     cairoOperator            '\v\?'
syn match     cairoOperator            '\v\;'
syn match     cairoOperator            '\v\='
syn match     cairoOperator            '\v\*\='
syn match     cairoOperator            '\v/\='
syn match     cairoOperator            '\v\+\='
syn match     cairoOperator            '\v-\='
" syn match   cairoOperator            '\v\>'
" syn match   cairoOperator            '\v\<'
" syn match   cairoOperator            '\v\>\='
" syn match   cairoOperator            '\v\<\='
hi def link   cairoOperator            Operator

" Builtins and Implicit
syn keyword   cairoBuiltIns            syscall_ptr pedersen_ptr HashBuiltin range_check_ptr builtins pedersen range_check
hi def link   cairoBuiltIns            Type

syn match     cairoEntityCondition     '\s\+.*\ze\s*:' contained
hi def link   cairoEntityCondition     Statement
"syn keyword cairoKeywordControlIf if nextgroup=cairoEntityCondition
"syn keyword cairoKeywordControlEnd end
"hi link     cairoKeywordControlIf     Special
"hi link     cairoKeywordControlEnd    Special

" Constants
syn match     cairoFuncModifier          /\v\@view|\@external|\@storage_var|\@contract_interface|\@constructor|\@event/
hi def link   cairoFuncModifier          Tag

" Strings
syn region    cairoString                start=+"+  skip=+\\\\\|\\$'+  end=+"+
hi def link   cairoString                String
hi def link   cairoTodo                  Todo
hi def link   cairoComment               Comment

" Natspec https://github.com/CairOpen/SIMPs/blob/main/SIMPS/simp-4.md
syn match     cairoNatspecTag            /@dev\>/ contained
syn match     cairoNatspecTag            /@title\>/ contained
syn match     cairoNatspecTag            /@author\>/ contained
syn match     cairoNatspecTag            /@notice\>/ contained
syn match     cairoNatspecTag            /@param\>/ contained
syn match     cairoNatspecTag            /@return\>/ contained
syn match     cairoNatspecParam          /\(@param\s*\)\@<=\<[a-zA-Z_][0-9a-zA-Z_]*/
syn match     cairoNatspecParam          /\(@return\s*\)\@<=\<[a-zA-Z_][0-9a-zA-Z_]*/
syn region    cairoNatspecBlock          start=/\#/ end=/$/ contains=cairoTodo,cairoNatspecTag,cairoNatspecParam,@Spell

hi def link   cairoNatspecTag            SpecialComment
hi def link   cairoNatspecBlock          Comment
hi def link   cairoNatspecParam          Define
