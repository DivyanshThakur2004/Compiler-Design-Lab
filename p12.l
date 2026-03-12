/* DESIGN A DF IN USING STATE DIAGRAM THAT ACCEPT THE INPUT STRING OG PATTERN ENDING WITH 01 AND SHOULD CONTAIN A SUBSTRING 11.*/
%{
#include <stdio.h>
%}
%s A B C D
%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN INITIAL;
<INITIAL>[^|\n]  BEGIN D;
<INITIAL>\n {BEGIN INITIAL;printf("String not accepted\n");}

<A>1 BEGIN B;
<A>0 BEGIN INITIAL;
<A>[^|\n]  BEGIN D;
<A>\n {BEGIN INITIAL;printf("String not accepted\n");}

<B>1 BEGIN B;
<B>0 BEGIN C;
<B>[^|\n]  BEGIN D;
<B>\n {BEGIN INITIAL;printf("String not accepted\n");}

<C>1 BEGIN B;
<C>0 BEGIN A;
<C>[^|\n]  BEGIN D;
<C>\n {BEGIN INITIAL;printf("String accepted\n");}

<D>1 BEGIN D;
<D>0 BEGIN D;
<D>[^|\n]  BEGIN D;
<D>\n {BEGIN INITIAL;printf("String not accepted\n");}
%%
int yywrap() { return 1; }
int main() {
    yylex();
    return 0;
}