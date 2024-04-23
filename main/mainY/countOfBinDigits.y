%{
   #include<stdio.h>
   int count = 0, c = 0;
   int yylex(void);
   void yyerror(char *s);
%}

%token digit

%%
S : L {printf("No.of Digits: %d", c); return 0;}
| L '\n';
L : L B {c = count;}
L : B {c = count;}
B : digit {count = count + 1;}
;

%%
void main()
{
   printf("Enter digits: ");
   yyparse();
}

void yyerror(char *s)
{
   
}