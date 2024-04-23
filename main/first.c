#include<stdio.h>
#include<ctype.h>

int noOfPro;
char production[20][20];

void first(char[], char);
void addToResult(char[], char);

int main()
{
	int choice;
	char c;

	char result[20];

	printf("Enter No. of Productions: ");
	scanf("%d", &noOfPro);

	for(int i = 0; i < noOfPro; i++)
	{
		printf("Enter Production%d : ", i + 1);
		scanf(" %s", &production[i]);
	}

	do
	{
		printf("\nFirst of: ");
		scanf(" %c", &c);

		first(result, c);

		printf("\nFirst(%c) = { ", c);

		for(int i = 0; result[i] != '\0'; i++)
		{
			printf("%c, ", result[i]);
		}

		printf(" }\n");

		printf("\nPress 1 to Continue: ");
		scanf("%d", &choice);
	}while(choice == 1);
}

void first(char *result, char c)
{
	int i, j, k;

	result[0] = '\0';
	int foundEpsilon = 0;
	char subResult[20];
	subResult[0] = '\0';

	if(!(isupper(c)))
	{
		addToResult(result, c);
		return;
	}

	for(int i = 0; i < noOfPro; i++)
	{
		if(production[i][0] == c)
		{
			if(production[i][2] == '$')
				addToResult(result, '$');
			else
			{
				j = 2;
				while(production[i][j] != '\0')
				{
					foundEpsilon = 0;

					first(subResult, production[i][j]);

					for(k = 0; subResult[k] != '\0'; k++)
						addToResult(result, subResult[k]);

					for(k = 0; subResult[k] != '\0'; k++)
					{
						if(subResult[k] == '$')
						{
							foundEpsilon = 1;
							break;
						}
					}

					if(!foundEpsilon)
						break;

					j++;
				}
			}
		}
	}
	return;
}

void addToResult(char *result, char c)
{
	int k;

	for(k = 0; result[k] != '\0'; k++)
	{
		if(result[k] == c)
			return;
	}

	result[k] = c;
	result[k + 1] ='\0';	
}
