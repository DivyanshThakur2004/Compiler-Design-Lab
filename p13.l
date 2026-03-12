/*desgin a dfa on lex it should contain the 3rd last character as "a" over input alphabet{a,b}*/
%{
#include <stdio.h>
%}
%x A B C D E F G X
%%
<INITIAL>a          { BEGIN A; }
<INITIAL>b          { BEGIN INITIAL; }
<INITIAL>[^ab\n]    { BEGIN X; }
<INITIAL>\n         { BEGIN INITIAL; printf("String not Accepted\n"); }
<A>a				{ BEGIN B; }
<A>b				{ BEGIN D; }
<A>[^ab\n] 		{ BEGIN X; }
<A>\n 			{ BEGIN INITIAL; printf("String not Accepted\n"); }
<B>a 			{ BEGIN C; }
<B>b 			{ BEGIN F; }
<B>[^ab\n]		{ BEGIN X; }
<B>\n 			{ BEGIN INITIAL; printf("String Not Accepted\n"); }
<C>a				{ BEGIN C; }
<C>b 			{ BEGIN F; }
<C>[^ab\n] 		{ BEGIN X; }
<C>\n 			{ BEGIN INITIAL; printf("String Accepted\n"); }
<D>a 			{ BEGIN E; }
<D>b 			{ BEGIN G; }
<D>[^ab\n]		{ BEGIN X; }
<D>\n 			{ BEGIN INITIAL; printf("String not Accepted\n"); }
<E>a 			{ BEGIN B; }
<E>b 			{ BEGIN D; }
<E>[^ab\n] 		{ BEGIN X; }
<E>\n 			{ BEGIN INITIAL; printf("String Accepted\n"); }
<F>a 			{ BEGIN E; }
<F>b 			{ BEGIN G; }
<F>[^ab\n] 		{ BEGIN X; }
<F>\n 			{ BEGIN INITIAL; printf("String Accepted\n"); }
<G>a 			{ BEGIN A; }
<G>b 			{ BEGIN INITIAL; }
<G>[^ab\n] 		{ BEGIN X; }
<G>\n 			{ BEGIN INITIAL; printf("String Accepted\n"); }
<X>a 			{ BEGIN X; }
<X>b 			{ BEGIN X; }
<X>[^ab\n] 		{ BEGIN X; }
<X>\n  			{ BEGIN INITIAL; printf("String not Accepted\n"); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}