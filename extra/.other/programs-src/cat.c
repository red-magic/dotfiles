#include <stdio.h>

int main(int argc, char *argv[]) {
	int c;
	if (argv[1] == NULL) {
		while((c = getchar()) != EOF) {
			putchar(c);
		}
	}
	else {
		FILE *fp;
		for (int i = 1; argv[i] != NULL; i++) {
			if ((fp = fopen(argv[i], "r"))) {
				while((c = getc(fp)) != EOF) {
					putchar(c);
				}
				fclose(fp);
			} else {
				printf("No such file '%s'\n", argv[i]);
			}
		}
	}
}
