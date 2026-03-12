%{
#include <stdio.h>
#include <string.h>
int isKeyword(char *word)
{
    char *keywords[] = {
        "int","float","char","double","if","else","while","for",
        "return","void","break","continue","switch","case","default",
        "do","struct","typedef","const","static","enum","sizeof"
    };
    int total = sizeof(keywords)/sizeof(keywords[0]);

    for(int i = 0; i < total; i++)
    {
        if(strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}
%%
"=="|"!="|"<="|">="|"++"|"--"|"&&"|"||"   { printf("Operator: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"<"|">"|"%"            { printf("Operator: %s\n", yytext); }
";"|","|"("|")"|"{"|"}"|"["|"]"            { printf("Separator: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* {
                            if(isKeyword(yytext))
                                printf("Keyword: %s\n", yytext);
                            else
                                printf("Identifier: %s\n", yytext);
                       }
[ \t\n]+   ;
.          ;
%%
int main()
{
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}
