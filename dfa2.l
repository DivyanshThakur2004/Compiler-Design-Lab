%{
#include <stdio.h>
%}
%x A B C D
%%
<INITIAL>1          { BEGIN A; }
<INITIAL>0          { BEGIN INITIAL; }
<INITIAL>[^01\n]    { BEGIN D; }
<INITIAL>\n         { BEGIN INITIAL; printf("String not Accepted\n"); }
<A>1                { BEGIN B; }
<A>0                { BEGIN INITIAL; }
<A>[^01\n]          { BEGIN D; }
<A>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<B>1             	{ BEGIN B; }
<B>0      	    	{ BEGIN C; }
<B>[^01\n]          { BEGIN D; }
<B>\n               { BEGIN INITIAL; printf("String not Accepted\n"); }
<C>1                { BEGIN B; }
<C>0				{ BEGIN A; }
<C>[^01\n]		{ BEGIN D; }
<C>\n			{ BEGIN  INITIAL; printf("String Accepted\n"); }
<D>1				{ BEGIN D; }
<D>0				{ BEGIN D; }
<D>[^01\n]		{ BEGIN D; }
<D>\n			{ BEGIN INITIAL; printf("Strinf not Accepted\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
