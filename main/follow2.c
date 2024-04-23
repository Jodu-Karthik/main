#include<stdio.h>
#include<string.h>
#include<ctype.h>

int noOfPro, resultInd;
char productions[10][10], result[20];

void follow(char);
void first(char);
void addToResult(char);

int main()
{
	int choice;
	char c;

	printf("Enter number of productions: ");
	scanf("%d", &noOfPro);

	for(int i = 0; i < noOfPro; i++)
	{
		printf("Enter Production %d: ", i + 1);
		scanf(" %s", productions[i]);
	}

	do
	{
		resultInd = 0;
		printf("Enter for which you want to find Follow: ");
		scanf(" %c", &c);

		follow(c);
		printf("Follow(%c) = { ", c);

		for(int i = 0; i < resultInd; i++)
			printf("%c, ", result[i]);

		printf(" }\n");

		printf("\nPress 1 to Continue\n0 to Exit: ");
		scanf("%d", &choice);
	}while(choice == 1);

	return 0;
}

void follow(char c)
{
	if(productions[0][0] == c)
		addToResult('$');

	for(int i = 0; i < noOfPro; i++)
	{
		for(int j = 2; j < strlen(productions[i]); j++)
		{
			if(productions[i][j] == c)
			{
				if(productions[i][j + 1] != '\0')
					first(productions[i][j + 1]);
				if(productions[i][j + 1] == '\0' && productions[i][0] != c)
					follow(productions[i][0]);
			}
		}
	}
}

void first(char c)
{
	int k;

	if(!(isupper(c)) && c != '$')
		addToResult(c);

	for(k = 0; k < noOfPro; k++)
	{
		if(productions[k][0] == c)
		{
			if(productions[k][2] == '$')
				follow(productions[k][0]);
			else if(islower(productions[k][2]) || productions[k][2] == '$')
				addToResult(productions[k][2]);
			else
				first(productions[k][2]);
		}
	}
}

void addToResult(char c)
{
	for(int i = 0; i < resultInd; i++)
	{
		if(result[i] == c)
			return;
	}
	result[resultInd++] = c;
}
