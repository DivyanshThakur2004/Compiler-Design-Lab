/*write a lex program to print the alternate characters of the input string.*/
%{
#include <stdio.h> 
int i=0;
%}
%%
.	{
        if(i%2==0)
            printf("%c",yytext[0]);
        i++;
    }
\n	{printf("\n"); i=0;}
%%
int yywrap()
{
    return 1;
}
int main()
{
    printf("Enter string: ");
    yylex();
    return 0;
}