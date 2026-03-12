%{
#include <stdio.h>
int lines = 0;
int spaces = 0;
int tabs = 0;
int meta = 0;
int others = 0;
%}
%%
\n              { lines++; }
" "             { spaces++; }
\t              { tabs++; }
[+\-*/=%&|^!~<>?:;,.]   { meta++; }
.               { others++; }
%%
int main()
{
    printf("Enter text:");
    yylex();
    printf("\n--- Count Result ---\n");
    printf("Lines: %d\n", lines);
    printf("Spaces: %d\n", spaces);
    printf("Tabs: %d\n", tabs);
    printf("Meta characters: %d\n", meta);
    printf("Other characters: %d\n", others);
    return 0;
}
int yywrap()
{
    return 1;
}
