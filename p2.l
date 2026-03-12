/*count number of numeric digits in the given input*/
%{
#include<stdio.h>
int num=0;
%}
%%
[0-9]	{num++;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	printf("No of numerics:%d \n",num);
	return 0;
}