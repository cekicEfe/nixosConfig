#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define PORT 12345
#define BUFFER_SIZE 1024

int main() {
  int sockfd;
  char buffer[BUFFER_SIZE];
  struct sockaddr_in server_addr, client_addr;
  socklen_t addr_len = sizeof(client_addr);

  // socket(): Create a UDP socket
  sockfd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockfd < 0) {
    perror("socket failed");
    exit(1);
  }

  // bind(): bind the IP address and port to the socket
  memset(&server_addr, 0, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY; // Restricts connection
  server_addr.sin_port = htons(PORT);

  if (bind(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
    perror("bind failed");
    close(sockfd);
    exit(1);
  }

  printf("UDP server listening on port %d...\n", PORT);
  // while(1){
  // recvfrom(): receive a message from a client
  int n = recvfrom(sockfd, buffer, BUFFER_SIZE, 0,
                   (struct sockaddr *)&client_addr, &addr_len);
  buffer[n] = '\0';
  printf("Client says: %s\n", buffer);

  // sendto(): Send a reply to the client
  char *msg = "Hello from server";
  sendto(sockfd, msg, strlen(msg), 0, (struct sockaddr *)&client_addr,
         addr_len);
  //}

  close(sockfd);
  return 0;
}
