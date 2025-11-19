#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <time.h>

#define NTP_SERVER "185.125.190.56"   // ntp.ubuntu.com
#define NTP_PORT 123
#define NTP_PACKET_SIZE 48
#define NTP_TIMESTAMP_DELTA 2208988800ull

int main() {
    int sockfd;
    struct sockaddr_in server_addr;
    unsigned char packet[NTP_PACKET_SIZE];

    // 1. Soket
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd < 0) {
        perror("socket failed");
        exit(1);
    }

    // 2. Sunucu adresi
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(NTP_PORT);
    inet_pton(AF_INET, NTP_SERVER, &server_addr.sin_addr);

    // 3. Paket (LI=0, VN=4, Mode=3)
    memset(packet, 0, NTP_PACKET_SIZE);
    packet[0] = 0x1B;

    // 4. İstek gönder
    if (sendto(sockfd, packet, NTP_PACKET_SIZE, 0,
               (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("sendto failed");
        close(sockfd);
        exit(1);
    }

    // 5. Cevap al
    socklen_t addr_len = sizeof(server_addr);
    if (recvfrom(sockfd, packet, NTP_PACKET_SIZE, 0,
                 (struct sockaddr*)&server_addr, &addr_len) < 0) {
        perror("recvfrom failed");
        close(sockfd);
        exit(1);
    }

    // 6. Saniyeler (40–43)
    unsigned long seconds = (unsigned long)packet[40] << 24 |
                            (unsigned long)packet[41] << 16 |
                            (unsigned long)packet[42] << 8  |
                            (unsigned long)packet[43];

    // 7. Fraction (44–47)
    unsigned long fraction = (unsigned long)packet[44] << 24 |
                             (unsigned long)packet[45] << 16 |
                             (unsigned long)packet[46] << 8  |
                             (unsigned long)packet[47];

    // UNIX epoch’a dönüştür
    seconds -= NTP_TIMESTAMP_DELTA;

    // Fraction → saniye altı (milisaniye)
    double frac_seconds = (double)fraction / (double)0x100000000ULL;
    double total_time = (double)seconds + frac_seconds;

    // 8. NTP zamanı
    time_t ntp_sec = (time_t)seconds;
    struct tm *ntp_tm = gmtime(&ntp_sec);
    char buf[64];
    strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", ntp_tm);
    printf("NTP server time   : %s.%03d UTC\n",
           buf, (int)(frac_seconds * 1000));

    // 9. Sistem zamanı (milisaniye ile)
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    struct tm *local_tm = localtime(&ts.tv_sec);
    strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", local_tm);
    printf("Local system time : %s.%03ld %s\n",
           buf, ts.tv_nsec / 1000000, local_tm->tm_zone);

    // 10. Fark
    double local_total = ts.tv_sec + ts.tv_nsec / 1e9;
    double diff = local_total - total_time;
    printf("Time difference   : %.3f seconds\n", diff);

    close(sockfd);
    return 0;
}
