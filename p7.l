/*how to take input from a file using lex*/
/*identify int and float value in a given input stream*/
/*vaild identifier*/
/*
to tokenize oprstoer seprator and identifier
extract html tags
*/
%{
#include <stdio.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"identifier:%s\n",yytext);}
[+\-*/=<>]        {fprintf(yyout,"operator:%s\n",yytext);}
[(),;{}]          {fprintf(yyout,"separator:%s\n",yytext);}
[if|else|while|for|return] {fprintf(yyout,"keyword:%s\n",yytext);}
%%
int yywrap()
{
    return 1;
}
int main()
{
    extern FILE *yyin,*yyout;
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    return 0;
}