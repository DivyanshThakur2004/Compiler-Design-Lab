%{
#include <stdio.h>
%}
%x A B C
%%
<INITIAL>a          { BEGIN C; }
<INITIAL>b          { BEGIN A; }
<INITIAL>\n         { BEGIN INITIAL; printf("String Accepted\n"); }
<A>a                { BEGIN B; }
<A>b                { BEGIN INITIAL; }
<A>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<B>a             	{ BEGIN A; }
<B>b      	    	{ BEGIN C; }
<B>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<C>a                { BEGIN INITIAL; }
<C>b				{ BEGIN B; }
<C>\n			{ BEGIN  INITIAL; printf("String not Accepted\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}