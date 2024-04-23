%{
	#include<stdio.h>
	int  vowCount = 0;
	int  consCount = 0;
%}

%%
[aeiouAEIOU] {vowCount++;}
[a-zA-Z] {consCount++;}
\n {return 0;}

%%
int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the String: ");
	yylex();
	printf("Vowels: %d\nConsonants: %d\nTotCount: %d", vowCount, consCount, (vowCount + consCount));
	return 0;
}