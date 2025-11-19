import socket

server_ip = "127.0.0.1"
port = 12345

sockfd = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0)

msg = "Hello from client"
sockfd.sendto(msg.encode(), (server_ip, port))

[data, _] = sockfd.recvfrom(1024)
print("Server says:", data.decode())
