%{
#include <stdio.h>
%}

%%
"<"[^>]+">"    fprintf(yyout,"%s\n",yytext);
.|\n           ;
%%

int yywrap(){ return 1; }

int main(){
    char inputFile[100], outputFile[100];
    extern FILE *yyin,*yyout;

    printf("Enter input HTML file name: ");
    scanf("%s", inputFile);

    printf("Enter output file name: ");
    scanf("%s", outputFile);

    yyin = fopen(inputFile,"r");
    if(!yyin){
        printf("Cannot open input file\n");
        return 1;
    }

    yyout = fopen(outputFile,"w");
    if(!yyout){
        printf("Cannot open output file\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("HTML tags extracted successfully.\n");
    return 0;
}
