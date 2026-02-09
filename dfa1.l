%{
#include <stdio.h>
%}
%x A B
%%
<INITIAL>1          { BEGIN INITIAL; }
<INITIAL>0          { BEGIN A; }
<INITIAL>[^01\n]    { BEGIN B; }
<INITIAL>\n         { BEGIN INITIAL; printf("String Accepted\n"); }
<A>1                { BEGIN A; }
<A>0                { BEGIN INITIAL; }
<A>[^01\n]          { BEGIN B; }
<A>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<B>[01]             { BEGIN B; }
<B>[^01\n]          { BEGIN B; }
<B>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
