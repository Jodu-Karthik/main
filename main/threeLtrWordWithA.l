%{
	#include<stdio.h>
	int length = 0;
	int totCount = 0;
	void fun(int a);
%}

%%
[a-zA-Z0-9]+ {length = yyleng; fun(length);}
'@' {printf("Total Word Count: %d", totCount); return 0;}

%%
void fun(int length)
{
	if(yytext[0] == 'A')
	{
		if(length == 3)
		{
			totCount++;
			printf("length of %s is 3\n", yytext);
		}
		else
		{
			printf("length is not 3\n");
		}
	}
	else
	{
		printf("word is not starting with 'A'\n");
	}
}

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	return 0;
}

