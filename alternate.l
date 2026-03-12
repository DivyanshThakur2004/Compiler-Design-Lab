%{
    #include <stdio.h>
%}
%%
[a-zA-Z0-9 ]+    {int n=yyleng;
            for(int i = 0;i < n;i++){
                if(i%2==0){
                    printf("%c",yytext[i]);
                }
            }
            printf("\n");
        }
.|\n    {printf("%s",yytext);}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

// cd "/mnt/d/VS Code/compiler_design"