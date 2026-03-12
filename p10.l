%{
    #include <stdio.h>
%}
%%
[01]*[1]+10$  {printf("accepted\n");}//accepts strings that have any combination of 0 and 1 followed by at least one 1 and then 10 at the end
.*  {printf("rejected\n");}
%%
int yywrap() {
    return 1;
}
int main() {
    yylex();
    return 0;
}
//substring 11 and strictly 10
//[01]*10$ is the correct regex for strictly 10 at the end and any combination of 0 and 1 before it.
