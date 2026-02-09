%{
#include <stdio.h>
%}
%x A B C
%%
<INITIAL>1          { BEGIN C; }
<INITIAL>0          { BEGIN A; }
<INITIAL>\n         { BEGIN INITIAL; printf("String Accepted\n"); }
<A>1                { BEGIN B; }
<A>0                { BEGIN INITIAL; }
<A>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<B>1             	{ BEGIN A; }
<B>0      	    	{ BEGIN C; }
<B>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<C>1                { BEGIN INITIAL; }
<C>0				{ BEGIN B; }
<C>\n			{ BEGIN  INITIAL; printf("String not Accepted\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
