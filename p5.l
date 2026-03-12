/*count number of words, alphabets and characters in a given input but with [a-zA-Z]*/
%{
#include<stdio.h>
int n=0;
int count=0;
%}

%%
[A-Za-z]*	{count++;}
[" "]           {;}
.               {n=1;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter: ");
	yylex();
	printf("No. of words: %d",count);
	return 0;
}
