%{

	#include<stdio.h>
	int intCount = 0, floatCount = 0;
%}


%%
[0-9]+"."[0-9]+ {printf("Decimal Number\n");floatCount++;}

[0-9]+ {printf("Integer\n");intCount++;}
'@' {return 0;}

%%
int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("IntCount: %d\nFloatCount: %d\nTotCount: %d", intCount, floatCount, (intCount + floatCount));
	return 0;
}