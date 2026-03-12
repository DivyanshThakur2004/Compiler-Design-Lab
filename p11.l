/*design a dfa that accpets any input sting which has even no od 1's and 0's*/
%{
#include <stdio.h>
%}
%s A B C
%%
<INITIAL>0     BEGIN A;
<INITIAL>1     BEGIN B;
<INITIAL>\n    { printf("Accepted\n"); }
<A>0           BEGIN INITIAL;
<A>1           BEGIN C;
<A>\n          { printf("Rejected\n"); BEGIN INITIAL; }
<B>0           BEGIN C;
<B>1           BEGIN INITIAL;
<B>\n          { printf("Rejected\n"); BEGIN INITIAL; }
<C>0           BEGIN B;
<C>1           BEGIN A;
<C>\n          { printf("Rejected\n"); BEGIN INITIAL; }
.              BEGIN C;
%%
int yywrap() { return 1; }
int main() { yylex(); return 0; }

