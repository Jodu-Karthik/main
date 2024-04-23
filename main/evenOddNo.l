%{
    #include<stdio.h>
    void fun(int num);
    int num = 0, evenCount = 0, oddCount = 0;
%}

%%
[0-9]+ {num = atoi(yytext); fun(num);}
[^0-9] {printf("Enter a Number: ");} 
'@' {printf("Even No Count: %d\nOdd No Count: %d\n", evenCount, oddCount); return 0;}

%%
void fun(int num)
{
    if(num % 2 == 0)
    {
        evenCount++;
        printf("%d is Even\n", num);
    }
    else
    {
        oddCount++;
        printf("%d is Odd\n", num);
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
