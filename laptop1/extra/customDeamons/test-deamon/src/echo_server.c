#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define PORT 12345
#define BUFFER_SIZE 1024

int main() {
  // file descriptors for the server itself and the connected client
  int server_fd, client_fd;

  // structs that hold server's and client's information
  struct sockaddr_in server_addr, client_addr;
  socklen_t addr_len;

  // buffer to store messages
  char buffer[BUFFER_SIZE];

  // socket(): create a TCP socket
  server_fd = socket(AF_INET, SOCK_STREAM, 0);
  if (server_fd < 0) {
    perror("socket");
    exit(EXIT_FAILURE);
  }

  // bind(): bind the IP address and port to the socket
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY;
  server_addr.sin_port = htons(PORT);

  if (bind(server_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
    perror("bind");
    close(server_fd);
    exit(EXIT_FAILURE);
  }

  // listen(): enqueue the connection requests
  if (listen(server_fd, 5) < 0) {
    perror("listen");
    close(server_fd);
    exit(EXIT_FAILURE);
  }

  printf("Listening on port %d...\n", PORT);

  // accept(): accept connection request
  addr_len = sizeof(client_addr);
  client_fd = accept(server_fd, (struct sockaddr *)&client_addr, &addr_len);
  if (client_fd < 0) {
    perror("accept");
    close(server_fd);
    exit(EXIT_FAILURE);
  }

  printf("New connection: %s\n", inet_ntoa(client_addr.sin_addr));

  // loop for receiving/sending messages
  while (1) {
    memset(buffer, 0, BUFFER_SIZE);
    int bytes_read = recv(client_fd, buffer, BUFFER_SIZE, 0);
    if (bytes_read <= 0)
      break;

    printf("Received from client: %s", buffer);

    // Send the same message back
    send(client_fd, buffer, bytes_read, 0);
  }

  // close the sockets
  close(client_fd);
  close(server_fd);
  printf("Connection terminated.\n");
  return 0;
}
