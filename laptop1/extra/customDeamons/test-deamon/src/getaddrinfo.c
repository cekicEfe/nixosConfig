#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char hostname[100];
  printf("Enter hostname: ");
  scanf("%s", hostname);

  struct addrinfo hints, *res = NULL;
  int status;

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_INET;
  hints.ai_socktype = SOCK_STREAM;

  if ((status = getaddrinfo(hostname, NULL, &hints, &res)) != 0) {
    perror("getaddrinfo");
    exit(1);
  }

  printf("IP addresses for %s:\n", hostname);

  for (struct addrinfo *p = res; p != NULL; p = p->ai_next) {
    char ipstr[INET_ADDRSTRLEN];
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)p->ai_addr;
    inet_ntop(AF_INET, &(ipv4->sin_addr), ipstr, sizeof ipstr);
    printf("  IPv4: %s\n", ipstr);
  }

  freeaddrinfo(res);
  return 0;
}
