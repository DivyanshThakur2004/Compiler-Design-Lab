%{
    #include <stdio.h>
    #include <ctype.h>
    FILE *yyin;
    FILE *yyout;
%}
%%
[a-z]  {fprintf(yyout,"%c",toupper(yytext[0]));}
[A-Z]  {fprintf(yyout,"%c",tolower(yytext[0]));}
.|\n    {fprintf(yyout,"%s",yytext);}
%%
int main(){
    char infile[50];
    char outfile[50];
    printf("Enter Input File Name:");
    scanf("%s",infile);
    printf("Enter output File Name:");
    scanf("%s",outfile);
    yyin=fopen(infile,"r");
    yyout=fopen(outfile,"w");
    if(!yyin || !yyout){
        return 0;
    }
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap(){
    return 1;
}