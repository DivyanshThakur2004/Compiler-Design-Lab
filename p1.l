/*count number of lines, tabs, spaces and characters in a given input*/
%{
#include <stdio.h>
int nl=0,tb=0,sp=0,ch=0;
%}
%%
\n 	{nl++;}
\t 	{tb++;}
" "	{sp++;}
.	{ch++;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	yylex();
	printf("No of lines:%d \n",nl);
	printf("No of tabs:%d\n",tb);
	printf("No of spaces:%d\n",sp);
	printf("No of characters:%d\n",ch); 
	return 0;
}