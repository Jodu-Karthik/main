%{
	#include<stdio.h>
	void yyerror(char *s);
	int flag = 0;	
%}

%token '(' ')' '\n'

%%
S : L '\n' {printf("Valid\n"); flag = 1; return 0;}
;
L : L '(' L ')' {}
| {}
;
%%

void main()
{
	yyparse();
	if(flag == 0)
		printf("Invalid");
}

void yyerror(char *s)
{
	
}