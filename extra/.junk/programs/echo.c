#include <stdio.h>

int main(int argc, char *argv[])
{
	if (argv[1] == NULL)
	{
		printf("\n");
	}
	else
	{
		for (int i = 1; argv[i] != NULL; ++i)
		{
			printf("%s ", argv[i]);
		}
		printf("\n");
	}
}
