%{
#include <stdio.h>
%}

%%
"//".*                ;
"/*"([^*]|\*+[^*/])*\*+"/"  ;
.|\n                  fprintf(yyout,"%s",yytext);
%%

int yywrap(){ 
    return 1; 
}

int main(){
    extern FILE *yyin,*yyout;
    yyin=fopen("input.txt","r");
    if(!yyin){ printf("Cannot open input file\n"); return 1; }
    yyout=fopen("output.txt","w");
    if(!yyout){ printf("Cannot open output file\n"); return 1; }
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
