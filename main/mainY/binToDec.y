%{
	#include<stdio.h>
	void yyerror(char *s);	
	int yylex(void);
%}

%token digit

%%
S :  L {$$ = $1;printf("Decimal Value : %d\n",$$);}
;
L : L B {$$ = 2*$1 + $2;}
| B {$$ = $1;} ;
B : digit {$$ = $1;}
;
%%

void main()
{
	yyparse();
}

void yyerror(char *s)
{
	
}