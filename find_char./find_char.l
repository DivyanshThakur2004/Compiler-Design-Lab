%{
#include <stdio.h>
int new = 0, space = 0, tab = 0, ch = 0, num = 0;
%}

%%
\n {new++;}
" " {space++;}
[0-9] {num++;}
\t {tab++;}
. {ch++;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("The Total Number of Characters in the input are %d\n",ch);
	printf("The Total Number of spaces in the input are %d\n",space);
	printf("The Total Number of tabs in the input are %d\n",tab);
	printf("The Total Number of new lines in the input are %d\n",new);
	printf("The Total Number of numerics in the input are %d\n",num);
	return 0;
}


//lex.p1.l
//gcc lex.yy.c
//./a.out
//ctrl + d {if no output is seen}
