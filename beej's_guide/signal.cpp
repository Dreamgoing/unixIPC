//
// Created by 王若璇 on 17/4/5.
//

#include <signal.h>
#include <cstdio>
#include <iostream>
#include <stdlib.h>
#include <errno.h>

using namespace std;
void sigint_handler(int sig) {
    ///ssize_t write(int fd, const void *buf, size_t count);
    ///fd :File Descriptors fd = 0,stdin; fd=1,stdout; fd=2,stderr;
    write(0, "Ahhh! SIGINT!\n", 14);
}
int main() {
    void sigint_handler(int sig); /* prototype */

    char s[200];
    struct sigaction sa;
    sa.__sigaction_u.__sa_handler = sigint_handler;
    sa.sa_flags = 0;
    sigemptyset(&sa.sa_mask); //清空阻塞空间

    if (sigaction(SIGINT, &sa, NULL) == -1) {
        perror("sigaction");//输出错误信号
        exit(1);
    }
    printf("Enter a string:\n");
    if (fgets(s, sizeof(s), stdin) == NULL) {
        perror("fgets");
    } else {
        printf("You entered: %s\n", s);
    }
    return 0;
}
