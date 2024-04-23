%{
    #include<stdio.h>
    int lc = 0, sc = 0, tc = 0, ch = 0, totCount = 0, wc = 0;
%}

%%
\n {lc++;}
[" "]+ {sc++;}
\t   {tc++;}
. {ch++; totCount++;}
[a-zA-Z0-9]+ {wc++; totCount = totCount + yyleng;}

'@' {return 0;}


%%
int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter String: ");
    yylex();

    printf("Lines Count: %d\n", lc);
    printf("Spaces Count: %d\n", sc);
    printf("Tabs Count: %d\n", tc);
    printf("Word Count: %d\n", (wc + ch));
    printf("Character Count: %d\n", totCount);
    return 0;
}
