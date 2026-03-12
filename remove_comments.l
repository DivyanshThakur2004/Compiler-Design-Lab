%{
    #include <stdio.h>
    FILE *yyin;
    FILE *yyout;
%}
%%
"//".*          ;
"/*"(.|\n)*"*/" ;
.|\n            {fprintf(yyout,"%s",yytext);}
%%
int main(){
    char filename[50];
    printf("Enter File name:");
    scanf("%s",filename);
    yyin=fopen(filename,"r");
    if(!yyin){
        return 0;
    }
    yyout=fopen("output.txt","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}
int yywrap(){
    return 1;
}