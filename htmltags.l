%{
    #include <stdio.h>
    FILE *yyin;
    FILE *yyout;
%}
%%
"<"[^>]+">"     {fprintf(yyout,"%s",yytext);}
.|\n        ;
%%
int main(){
    char infile[50];
    char outfile[50];
    printf("Enter Input File Name:");
    scanf("%s",infile);
    printf("Enter Output File Name:");
    scanf("%s",outfile);
    yyin = fopen(infile,"r");
    yyout=fopen(outfile,"w");
    if(!yyin || !yyout){
        return 0;
    }
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}

//we can also use REGEX </?[a-zA-Z][^>]*>

int yywrap(){
    return 1;

}
