grammar t045dfabug;
options {
    language =Cpp;
    output = AST;
}

@lexer::includes
{
#include "UserTestTraits.hpp"
}
@lexer::namespace
{ Antlr3Test }

@parser::includes {
#include "UserTestTraits.hpp"
}
@parser::namespace
{ Antlr3Test }

// this rule used to generate an infinite loop in DFA.predict
r
options { backtrack=true; }
    : (modifier+ INT)=> modifier+ expression
    | modifier+ statement
    ;

expression
    : INT '+' INT
    ;

statement
    : 'fooze'
    | 'fooze2'
    ;

modifier
    : 'public'
    | 'private'
    ;

ID : 'a'..'z' + ;
INT : '0'..'9' +;
WS: (' ' | '\n' | '\t')+ {$channel = HIDDEN;};

