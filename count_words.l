%{
#include <stdio.h>
int invalid = 0;
int count = 0;
%}

%%
[A-Za-z]+      { count++; }
[" "]          {;}    
.              { invalid=1; } 
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter name: ");
    yylex();

    if (invalid || count == 0)
        printf("Not a valid name\n");
    else
        printf("Valid name\n");
        printf("No of words: %d",count);

    return 0;
}
