import socket
port = 12345

sockfd = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0)
sockfd.bind(('0.0.0.0', port))

# receive a message from sockfd with recvfrom
[data, client_addr] = sockfd.recvfrom(1024)
print("Client says:", data.decode())

sockfd.sendto("Hello from server".encode(), client_addr)
sockfd.close()
