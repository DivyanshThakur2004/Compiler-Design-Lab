/*
1) Write a LEX Program to replace white spaces with single blank space, take input from a file and store output in output.txt file 
2) Tokenize operators, seperators, keywords and identifiers.
3) Remove comments from a c file,
4) Extract(Remove) HTML Tage
*/
%{
#include <stdio.h>
%}

%%
[ \t\n]+    fprintf(yyout, " ");
.           fprintf(yyout, "%s", yytext);
%%
int yywrap()
{
	return 1;
}
int main()
{
    extern FILE *yyin,*yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    yylex();
    return 0;
}
