%{
    #include <stdio.h>
%}
%x A B D
%%
<INITIAL>0          {BEGIN INITIAL;}
<INITIAL>1          {BEGIN A;}
<INITIAL>\n         {BEGIN INITIAL; printf("String not Accepted\n");}
<INITIAL>[^01\n]    {BEGIN D;}
<A>0                {BEGIN B;}
<A>1                {BEGIN A;}
<A>\n               {BEGIN INITIAL; printf("String not Accepted\n");}
<A>[^01\n]          {BEGIN D;}
<B>0                {BEGIN INITIAL;}
<B>1                {BEGIN A;}
<B>\n               {BEGIN INITIAL; printf("String Accepted\n");}
<B>[^01\n]          {BEGIN D;}
<D>0                {BEGIN D;}
<D>1                {BEGIN D;}
<D>\n               {BEGIN INITIAL; printf("String not Accepted\n");}
<D>[^01\n]          {BEGIN D;}
%%
int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}