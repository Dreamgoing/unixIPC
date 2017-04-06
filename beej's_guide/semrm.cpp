//
// Created by 王若璇 on 17/4/6.
//

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>

int main(void) {
    key_t key;
    int semid;
    union semun arg;

    if ((key = ftok("../pipe", 'R')) == -1) {
        perror("ftok");
        exit(1);
    }

    /* grab the semaphore set created by seminit.c: */
    if ((semid = semget(key, 1024, 0644)) == -1) {
        perror("semget");
        exit(1);
    }

    char *data;
    data = (char *)shmat(semid,(void *)0,0);

    printf("%s",data);

    /* remove it: */
    if (semctl(semid, 0, IPC_RMID, arg) == -1) {
        perror("semctl");
        exit(1);
    }

    return 0;
}