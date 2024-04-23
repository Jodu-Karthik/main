%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%
[()] {return yytext[0];}

%%
int yywrap()
{
	return 1;
}