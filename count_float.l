%{
    #include <stdio.h>
    int fl=0,in=0;
%}
%%
[0-9]+  {in++;}
[0-9]+\.[0-9]+  {fl++;}
.   ;
%%
int main(){
    yylex();
    printf("The Total Number of Digits are %d\n",in);
    printf("The Total Number of Float Values are %d\n",fl);
    return 0;
}
int yywrap(){
    return 1;
}