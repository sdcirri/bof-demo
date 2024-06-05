#include <string.h>
#include <stdio.h>

#define N 3

int authorized(char *user) {
	char *authorized_users[N] = {
		"pippo",
		"pluto",
		"paperino"
	};
	for(int i = 0; i < N; i++)
		if(strcmp(user, authorized_users[i]) == 0)
			return 1;
	return 0;
}

void show_secret() {
	FILE *secret = fopen("/usr/share/top-secret", "r");
	if(secret == NULL)
		printf("Il file top secret non \u00E8 presente nel sistema.\n");
	else {
		char buf[1024];
		printf("Contenuto del file top secret:\n");
		while(fgets(buf, 1024, secret) != 0)
			printf("%s", buf);
		fclose(secret);
		putchar('\n');
	}
}

