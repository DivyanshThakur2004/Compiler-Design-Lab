%{
#include <stdio.h>
#include <string.h>
char* keyword[] = {"while","do","if","for","int","else","double","float","char",NULL};
int iskeyword(char* sent){
    for(int i=0;keyword[i]!=NULL;i++){
        if(strcmp(sent,keyword[i])==0){
            return 1;
        }
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9]*   {if(!iskeyword(yytext)){
                            printf("Identifier: %s\n",yytext);}}
.|\n    ;
%%
int main(){
    printf("Enter input:");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}