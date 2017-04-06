//
// Created by 王若璇 on 17/4/6.
//

#include <iostream>
#include <cstdio>
#include <cerrno>
#include <unistd.h>
#include <stddef.h>
#include <sys/msg.h>
using namespace std;


int main(){
    key_t  key = ftok("/User/wangruoxuan/ClionProjects/unixIPC",'b');
    msqid = msgget(key,0666|IPC_CREAT);
    return 0;
}

