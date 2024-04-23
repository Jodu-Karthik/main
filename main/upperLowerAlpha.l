%{
	#include<stdio.h>
	int upperCount = 0;
	int lowerCount = 0;
%}

%%
[A-Z] {upperCount++;}
[a-z] {lowerCount++;}
\n {return 0;}


%%
int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter a String: ");
	yylex();
	printf("Upper : %d \nLower : %d\n", upperCount, lowerCount);
	printf("Total Count: %d", (upperCount + lowerCount));
	return 0;
}