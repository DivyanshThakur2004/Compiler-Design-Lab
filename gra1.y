%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token A B NL

%%

stmt : S NL   { printf("Valid string\n"); exit(0); }
     ;

S    : A S B
     | A B
     ;

%%

void yyerror(const char *s)
{
    printf("Invalid string\n");
    exit(0);
}

int main(void)
{
    printf("Enter string: ");
    yyparse();
    return 0;
}
