#include <unistd.h>
#include <stdio.h>

#include "secret.h"

void auth() {
	char username[64];
	printf("Come ti chiami? ");
	gets(username);
	if(authorized(username))
		show_secret();
	else fprintf(stderr, "Mi dispiace, non puoi visualizzare il file\n");
}

int main() {
	setvbuf(stdin, NULL, _IONBF, 0);	// Input unbuffered
	setuid(0);				// Setta il real UID per accedere al documento
	auth();
	return 0;
}

