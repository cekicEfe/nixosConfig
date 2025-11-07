#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define PORT 12345
#define BUFFER_SIZE 1024

//
// Write a chat program in c :
//

int main() {
  int sockfd;
  struct sockaddr_in server_addr;
  char buffer[BUFFER_SIZE];

  // socket(): create a socket for the TCP client
  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd < 0) {
    perror("socket");
    exit(EXIT_FAILURE);
  }

  // address information of the server
  server_addr.sin_family = AF_INET;
  server_addr.sin_port = htons(PORT);
  inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr);

  // connect(): connect to the server
  if (connect(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) <
      0) {
    perror("connect");
    close(sockfd);
    exit(EXIT_FAILURE);
  }

  printf("Connected to server. Enter a message (Ctrl+D to exit):\n");

  // loop for receiving/sending messages
  while (fgets(buffer, BUFFER_SIZE, stdin)) {
    send(sockfd, buffer, strlen(buffer), 0);

    memset(buffer, 0, BUFFER_SIZE);
    recv(sockfd, buffer, BUFFER_SIZE, 0);
    printf("Received from server: %s", buffer);
  }

  // close(): close the socket
  close(sockfd);
  printf("\nConnection terminated.\n");
  return 0;
}
