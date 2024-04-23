%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%
[01] {yylval = atoi(yytext); return digit;}

%%

int yywrap()
{
	return 1;
}
