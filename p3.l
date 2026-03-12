/*count number of words, alphabets and characters in a given input*/
%{
#include <stdio.h>
int wrd=0, alpha=0, ch=0;
%}

%% 
[a-zA-Z]+      { wrd++; alpha += yyleng; ch += yyleng; }
[ \t\n]        { ch++; }
.              { ch++; }
%%
int yywrap(){ return 1; }

int main(){
    yylex();
    printf("Words: %d\n", wrd);
    printf("Alphabets: %d\n", alpha);
    printf("Characters: %d\n", ch);
    return 0;
}
