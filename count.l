%{
    #include <stdio.h>
    int spaces=0,words=0,lines=1,ch=0;
    FILE* yyin;
%}
%%
\n              {lines++;ch++;}
[ \t]+          {spaces += yyleng; ch += yyleng;}
[a-zA-Z0-9_]+   {words++;ch += yyleng;}
.               {ch++;}
%%
int main(){
    yyin = fopen("input.txt","r");
    if(!yyin){
        return 0;
    }
    yylex();
    printf("Number of Lines:%d\n",lines);
    printf("Number of Words:%d\n",words);
    printf("Number of Spaces:%d\n",spaces);
    printf("Number of Characters:%d\n",ch);
    return 0;
}
int yywrap(){
    return 1;
}


//                                          "/*"(.|\n)*"*/"   { printf("Multiline Comment\n"); }