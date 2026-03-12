%{
    #include <stdio.h>
%}
%x A B C D E
%%
<INITIAL>0       {BEGIN A;}
<INITIAL>1       {BEGIN D;}
<INITIAL>\n      {BEGIN INITIAL; printf("String not accepted\n");}
<INITIAL>[^01\n] {BEGIN E;}
<A>0             {BEGIN A;}
<A>1             {BEGIN B;}
<A>\n            {BEGIN INITIAL; printf("String Accepted\n");}
<A>[^01\n]       {BEGIN E;}
<B>0             {BEGIN A;}
<B>1             {BEGIN B;}
<B>\n            {BEGIN INITIAL; printf("String not Accepted\n");}
<B>[^01\n]       {BEGIN E;}
<C>0             {BEGIN C;}
<C>1             {BEGIN D;}
<C>\n            {BEGIN INITIAL; printf("String not Accepted\n");}
<C>[^01\n]       {BEGIN E;}
<D>0             {BEGIN C;}
<D>1             {BEGIN D;}
<D>\n            {BEGIN INITIAL; printf("String Accepted\n");}
<D>[^01\n]       {BEGIN E;}
<E>0             {BEGIN E;}
<E>1             {BEGIN E;}
<E>\n            {BEGIN INITIAL; printf("String not Accepted\n");}
<E>[^01\n]       {BEGIN E;}
%%
int main(){
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}