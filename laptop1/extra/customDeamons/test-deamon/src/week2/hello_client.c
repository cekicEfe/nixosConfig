#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define SERVER_IP "127.0.0.1" // talk to yourself
#define PORT 12345
#define BUFFER_SIZE 1024

int main() {
  int sockfd;
  char buffer[BUFFER_SIZE];
  struct sockaddr_in server_addr;
  socklen_t addr_len = sizeof(server_addr);

  // socket(): create a UDP socket
  sockfd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockfd < 0) {
    perror("socket failed");
    exit(1);
  }

  // prepare server address info
  memset(&server_addr, 0, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  server_addr.sin_port = htons(PORT);
  inet_pton(AF_INET, SERVER_IP, &server_addr.sin_addr);

  // sendto(): send a message to the server
  char *msg = "Hello from client";
  sendto(sockfd, msg, strlen(msg), 0, (struct sockaddr *)&server_addr,
         addr_len);

  // recvfrom(): receive a reply
  int n = recvfrom(sockfd, buffer, BUFFER_SIZE, 0,
                   (struct sockaddr *)&server_addr, &addr_len);
  buffer[n] = '\0';
  printf("Server says: %s\n", buffer);

  close(sockfd);
  return 0;
}
