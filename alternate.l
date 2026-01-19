%{
#include <stdio.h>
int pos = 0;
%}

%%
. { 
    if (pos % 2 == 0) {
        printf("%s", yytext);
    }
    pos++; 
}

\n { 
    printf("\n");
    pos = 0; 
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input string: ");
    yylex();
    return 0;
}
