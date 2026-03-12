/* to remove comments from a c file*/
%{
#include<stdio.h>
%}
%%
"/*"([^*]|\*+[^*/])*\*+"/"    ;
"//".*                          ;
%%
int yywrap()
{
    return 1;
}
int main()
{
    extern FILE *yyin,*yyout;
    yyin=fopen("input.c","r");
    yyout=fopen("output.c","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}