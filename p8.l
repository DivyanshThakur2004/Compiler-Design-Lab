/* Write a lex program to read a C source file and replace each sequence of one or more blanks, tabs, and newlines by a single blank. Also, each period (.) should be printed as it is. The modified output should be written to another file. */
%{
#include <stdio.h>
%}
%%
[ ]+      {fprintf(yyout," ");}
[\t\n] {fprintf(yyout," ");}
[.]        {fprintf(yyout,"%c",yytext[0]);}
%%
int yywrap()
{
    return 1;
}
int main()
{
    extern FILE *yyin,*yyout;
    yyin=fopen("input1.txt","r");
    yyout=fopen("output1.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}