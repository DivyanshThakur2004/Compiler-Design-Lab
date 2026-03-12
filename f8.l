%{
    #include<stdio.h>
%}
%%
"<"[^>]*">"   { fprintf(yyout, "%s\n", yytext      ); }
.       ;    
%%
int yywrap(){ return 1; }
int main(){
    extern FILE *yyin, *yyout;
    yyin = fopen("input.html", "r");
    yyout = fopen("output3.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}