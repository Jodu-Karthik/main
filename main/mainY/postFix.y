%{
	#include<stdio.h>
	int yylex(void);
	void yyerror(char *s);
%}

%token id
%left '+' '-'
%left '*' '/'

%%
E1 : E '\n' {return 0;}
| E {};
E : E '+' T {printf("+");}
| E '-' T {printf("-");}
| T {};
T : T '*' F {printf("*");}
| T '/' F {printf("/");}
| F {};

F : id {printf("%d", $1);}
;

%%
int main()
{
	yyparse();
	return 0;
}

void yyerror(char *s)
{
	
}