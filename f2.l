%{
#include<stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z_0-9]*  {printf("Valid");}
.   {printf("Invalid"); exit(0);}
%%
int yywrap()
{
    return 1;
}
int main()
{
    yylex();
    return 0;
}