//
// Created by 王若璇 on 17/4/6.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <errno.h>

int main(){

    key_t key;
    int shmid;
    char* data;
    if((key = ftok("../pipe",'R'))==-1){
        perror("ftok");
        exit(1);
    }
    if((shmid=shmget(key,1024,0444))==-1){
        perror("shmget");
        exit(1);
    }

    data = (char *)shmat(shmid,(void *)0,0);
    if(data == (char *)(-1)){
        perror("shmat");
        exit(1);
    }
    int len = strlen(data);
    data[len]='\0';
    printf("%s\n",data);

    if(shmctl(shmid,IPC_RMID,NULL)==1){
        perror("shmat");
        exit(1);
    }
    return 0;
}