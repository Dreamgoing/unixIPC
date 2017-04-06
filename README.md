
# UNIX IPC(Inter-Process Communication)
## fork()函数
fork函数通过系统调用创建一个与原来进程几乎相同的进程。也就是两个进程可以做完全相同的事，但如果初始参数或者传入的变量不同，两个进程也可以做不同的事。

一个进程调用fork（）函数后，系统先给新的进程分配资源，例如存储数据和代码的空间。然后把原来的进程的所有值都复制到新的新进程中，只有少数值与原来的进程的值不同。相当于克隆了一个自己。

fork调用的一个奇妙之处就是它仅仅被调用一次，却能够返回两次，它可能有三种不同的返回值：

+ 在父进程中，fork返回新创建子进程的进程ID；
+ 在子进程中，fork返回0；
+ 如果出现错误，fork返回一个负值；

``` c++
//
// Created by 王若璇 on 17/4/5.
//

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void)
{
    pid_t pid;
    int rv;

    switch(pid = fork()) {
        case -1:
            perror("fork");  /* something went wrong */
            exit(1);         /* parent exits */

        case 0:
            printf(" CHILD: This is the child process!\n");
            printf(" CHILD: My PID is %d\n", getpid());
            printf(" CHILD: My parent's PID is %d\n", getppid());
            printf(" CHILD: Enter my exit status (make it small): ");
            scanf(" %d", &rv);
            printf(" CHILD: I'm outta here!\n");
            exit(rv);

        default:
            printf("PARENT: This is the parent process!\n");
            printf("PARENT: My PID is %d\n", getpid());
            printf("PARENT: My child's PID is %d\n", pid);
            printf("PARENT: I'm now waiting for my child to exit()...\n");
            wait(&rv);
            printf("PARENT: My child's exit status is: %d\n", WEXITSTATUS(rv));
            printf("PARENT: I'm outta here!\n");
    }

    return 0;
}
```


## Signals（信号）

基础来说，一个进程可以产生一个信号并且使该信号传送到另一个进程中去。目的进程的信号处理函数被调用，且当前进程可以处理它。
>Basically, one process can "raise" a signal and have it delivered to another process. The destination process's signal handler (just a function) is invoked and the process can handle it.

例如：一个进程也许想要停止另外一个进程，这件事可以通过发送一个SIGSTOP信号给另一个进程来实现。许多信号在系统中可以预先被设定好，并且进程有一个默认的信号处理函数来处理它。
>For example, one process might want to stop another one, and this can be done by sending the signal SIGSTOP to that process. To continue, the process has to receive signal SIGCONT. How does the process know to do this when it receives a certain signal? Well, many signals are predefined and the process has a default signal handler to deal with it.

Unix的kill命令是一种给进程发送信号的方法。这是系统调用的方法，通过传入信号ID和进程号ID的参数。
>As you can guess the Unix "kill" command is one way to send signals to a process. By sheer unbelievable coincidence, there is a system call called kill() which does the same thing. It takes for its argument a signal number (as defined in signal.h) and a process ID. Also, there is a library routine called raise() which can be used to raise a signal within the same process.

可以使用sigaction()函数来获取所有的信息，来确定捕捉到哪个信号，并且调用哪一个函数来处理该信号。
>You need to call sigaction() and tell it all the gritty details about which signal you want to catch and which function you want to call to handle it.

```  c++
int sigaction(int sig, const struct sigaction *act,
              struct sigaction *oact);
```

+ sig：要捕捉的信号ID
+ act：结构体内部包含了处理信号的函数指针，以及相关的控制方法
+ oact：可以为空，若不为空，则返回旧版本的信号处理函数等相关信息，通常用来在本次调用处理时，存储先前版本的信号处理函数。


__<sys/singal.h> 中sigaction定义__

``` c++
/* union for signal handlers */
union __sigaction_u {
	void    (*__sa_handler)(int);
	void    (*__sa_sigaction)(int, struct __siginfo *,
		       void *);
};

/* Signal vector template for Kernel user boundary */
struct	__sigaction {
	union __sigaction_u __sigaction_u;  /* signal handler */
	void    (*sa_tramp)(void *, int, int, siginfo_t *, void *);
	sigset_t sa_mask;		/* signal mask to apply */
	int	sa_flags;		/* see signal options below */
};

/*
 * Signal vector "template" used in sigaction call.
 */
struct	sigaction {
	union __sigaction_u __sigaction_u;  /* signal handler */
	sigset_t sa_mask;		/* signal mask to apply */
	int	sa_flags;		/* see signal options below */
};
```
__关注三个属性：__	

+ sa\_handler:信号处理函数（或者为SIG_IGN来忽略它）, 对应联合体 \_\_sigaction\_u
+ sa_mask:当一个信号被处理时，其他需要阻塞的信号集合
+ sa_flags：一系列修改处理函数的标记，或者为0

``` c++
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

```
上述程序输入control+c时，会出现

```
Enter a string:
^CAhhh! SIGINT!
fgets: Interrupted system call
```
发出了信号，实现了中断系统的系统调用。

## Pipes(管道)

### 介绍
管道（pipe）是所有Unix都愿意提供的一种进程间通信的机制。管道是进程间的一个单向数据流：一个进程写入管道的所有数据都由内核定向到另一个进程，另一个进程由此就可以从管道中读取数据。（可以通过‘｜’命令来创建管道）

管道是一种半双工的通信方式，数据只能单向流动，并且只能在具有亲缘关系的进程间流动，父子进程。
### 使用管道
管道被看作是打开的文件，但在已安装文件系统中没有相应的映像，可以使用 __pipe()__ 系统调用来创建一个新管道，该系统调用返回一对文件描述符(fd:File description)；然后进程通过fork()把，这两个文件描述符传递给它的子进程，由此与子进程共享管道。这样进程就可以在read()系统调用中使用 __第一个文件描述符__ 从管道中 __读__ 取数据,同样也可以在write()系统调用中使用 __第二个文件描述符__ 向管道中 __写__ 入数据。

例如：

统计当前目录下面，有多少文件数，运用了管道的技术。 （wc 为统计当前文本中的-c子节数，-l行数，-m字符数 -w单词数）

```  bash
ls -l|wc -l
```

__简单例子__

``` c++
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
    int pfds[2];
    char buf[30];

    pipe(pfds);

    if (!fork()) {
        printf(" CHILD: writing to the pipe\n");
        write(pfds[1], "test", 5);
        printf(" CHILD: exiting\n");
        exit(0);
    } else {
        printf("PARENT: reading from pipe\n");
        read(pfds[0], buf, 5);
        printf("PARENT: read \"%s\"\n", buf);
        wait(NULL);
    }

    return 0;
}

```

__语言实现ls ｜wc －l__

``` c++
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    int pfds[2];

    pipe(pfds);

    if (!fork()) {
        close(1);       /* close normal stdout */
        dup(pfds[1]);   /* make stdout same as pfds[1] */
        close(pfds[0]); /* we don't need this */
        execlp("ls", "ls", NULL);
    } else {
        close(0);       /* close normal stdin */
        dup(pfds[0]);   /* make stdin same as pfds[0] */
        close(pfds[1]); /* we don't need this */
        execlp("wc", "wc", "-l", NULL);
    }

    return 0;
}
```

使用管道最好的方法可能是我们最习惯的方法，即在命令行使用管道实现从一个程序的输出到另一个程序的输入。对于其他的使用场景有太多的限制，因此IPC技术会更好的实现。
>Probably the best use for pipes is the one you're most accustomed to: sending the standard output of one command to the standard input of another. For other uses, it's pretty limiting and there are often other IPC techniques that work better.



## FIFOs

### 简介
虽然管道是一种十分简单，灵活，有效的通信机制，但是它们有一个主要的缺点，也就是无法打开已经存在的管道。这就使得任意的两个进程不可能共享同一个管道，除非管道由一个共同的祖先进程创建。

为了突破如上限制，Unix系统引入了一种称为命名管道(named pipe)或者(FIFO)，命名管道也是一种半双工的通信方式，它允许无亲缘关系的进程间通信。

### 使用命名管道
命名管道可以通过mknod和mkfifo传入合适的参数来创建。两个进程通过命名管道进行通信时，管道的标识符为管道名。

``` c++
mkfifo [options] fifo_name
mknod [OPTION]... NAME TYPE

int mknod(const char *pathname, mode_t mode, dev_t dev); 
//The system call mknod() creates a filesystem node (file, device 
//special file or named pipe) named pathname, with attributes 
//specified by mode and dev.


```

__向命名管道写文件__

``` c++
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#define FIFO_NAME "american_maid"

int main(void)
{
    char s[300];
    int num, fd;

    mknod(FIFO_NAME, S_IFIFO | 0666, 0);

    printf("waiting for readers...\n");
    fd = open(FIFO_NAME, O_WRONLY);
    printf("got a reader--type some stuff\n");

    while (gets(s), !feof(stdin)) {
        if ((num = write(fd, s, strlen(s))) == -1)
            perror("write");
        else
            printf("speak: wrote %d bytes\n", num);
    }

    return 0;
}
```

__从命名管道读文件__

``` c++
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#define FIFO_NAME "american_maid"

int main(void)
{
    char s[300];
    int num, fd;

    mknod(FIFO_NAME, S_IFIFO | 0666, 0);

    printf("waiting for writers...\n");
    fd = open(FIFO_NAME, O_RDONLY);
    printf("got a writer\n");

    do {
        if ((num = read(fd, s, 300)) == -1)
            perror("read");
        else {
            s[num] = '\0';
            printf("tick: read %d bytes: \"%s\"\n", num, s);
        }
    } while (num > 0);

    return 0;
}
```

## Message Queue(消息队列)

### 简介
消息队列是消息的链表，存放在内核中并由消息队列标识符标识。在某一个进程往一个消息队列中写入消息之前，并不需要另外一个进程在该队列上等待消息的到达，这区别于FIFO和管道。

管道和FIFO都随进程持续，XSI IPC(消息队列，信号量，共享内存)都是随内核持续的

消息队列是链表的形式，故可以实现非先入先出的操作

### 创建和使用消息队列

``` c++
int msgget(key_t key, int msgflg);
```

可以通过msgget函数来打开一个已存在的消息队列，或者创建一个消息队列。成功则返回一个消息队列的ID，否则返回－1。

key为系统范围内描述一个想要连接的消息队列的ID值。每一个想要连接到同一个消息队列的进程必须拥有同样的消息队列号(message queue ID)

msgflg为参数标记符，该符号告诉msgget函数如何处理消息队列。当要创建一个消息队列时，使用IPC_CREAT 与 对消息队列操作权限的或。


key_t为32位int值，如何烦于创建消息队列，可以通过路径＋参数的方法创建key值

``` c++
key_t ftok(const char *path, int id);
```

``` c++
 key_t  key = ftok("/User/wangruoxuan/ClionProjects/unixIPC",'b');
 msqid = msgget(key,0666|IPC_CREAT);
```
可以通过如上的方式创建一个消息队列，如果其他进程要连接该消息队列，则需要通过如上方法创建一个key值。

0666(rw-rw-rw-)为对消息队列的操作权限

``` c++
struct mymsg {
	long	mtype;		/* message type (+ve integer) */
	char	mtext[1];	/* message body */
};
```
在发送消息时，发送结构体时，保证结构体第一个字段为long即可。

``` c++
///发送消息函数
int msgsnd(int msqid, const void *msgp,
           size_t msgsz, int msgflg);

///接受消息函数
int msgrcv(int msqid, void *msgp, size_t msgsz,
           long msgtyp, int msgflg);

```

在消息接受函数中msgtyp参数有如下含义：

+ 0:取回消息队列中的下一条信息，不管它的mtype
+ \>0:获得下一个消息的mtype == msgtyp的消息
+ \<0:取回消息队列中第一个mtype<=msgtyp的消息 

###销毁一个消息队列

``` c++
int msgctl(int msqid, int cmd,
           struct msqid_ds *buf);
```
msqid 为msgget的返回值（消息队列的ID）

使用如下，可以删除一个消息队列：

``` c++
msgctl(msqid,IPC_RMID,NULL);
```

###特殊情况

当消息队列满时，（或着达到了最大消息数，或者达到了队列最大字节数），则试图让新消息入队的进程可能被阻塞。

当消息队列为空时，（或者当进程指定的一条消息不在队列时），则接受进程也会被阻塞。

##Semaphores(信号量)

###简介
信号量可以被认为是真正广泛使用，并具有建设性意义的锁机制，可以使用信号量来进行对文件，共享内存的存取。

信号量是一个计数器，用于多进程对共享数据的访问。

为了获得共享资源，则需要执行如下步骤：

+ 测试控制资源的信号量
+ 若此信号量的值为正，则进程可以使用该资源。进程将信号量值减1，表示它使用了一个资源单位。
+ 若此信号量的值为0，则进程进入休眠状态，直至信号量值大于0。进程被唤醒后，它返回执行第1步。

为了正确地实现信号量，信号量值的测试及减1操作应当是原子操作。为此，信号量通常是在内核中实现的。

### 创建和使用

``` c++
int semget(key_t key, int nsems, int semflg);
```

nsems 为创建的一个信号量集合中的个数。

``` c++

///操控信号量,对信号量进行控制操作
int semctl(int semid, int semnum,
           int cmd, ... /*arg*/);
```

semid为由semget获得的值，semnum预期希望修改到的值

``` c++ 
///使用semget打开一个信号量集后，对其中一个或多个信号量的操作就使用semop函数来执行。
int  semop (int semid,  struct sembuf * opsptr,  size_t nops) ;
struct sembuf {
	unsigned short	sem_num;	/* [XSI] semaphore # */
	short		sem_op;		/* [XSI] semaphore operation  */
	short		sem_flg;	/* [XSI] operation flags */
};
```

上述sembuf结构体中：

+ 若sem_op为正，这对应于进程释放占用的资源数。sem_op值加到信号量的值上。（V操作）
+ 若sem_op为负,这表示要获取该信号量控制的资源数。信号量值减去sem_op的绝对值。（P操作）
+ 若sem_op为0,这表示调用进程希望等待到该信号量值变成0

##Shared Memory Segments(共享内存段)

###简介
最有用的IPC机制是共享内存，这种机制允许两个或多个进程通过把公共数据结构放入一个共享内存区(IPC shared memory region)来访问它们。如果进程要访问这种存放在共享内存区的数据结构，就必须在自己的地址空间中增加一个新内存区，它将映射与这个共享内存区相关的页框。这样的页框可以很容易的由内核通过请求调页进行处理。

通过调用shmget()函数来获得一个共享内存区的IPC标识符，若该共享内存区不存在，就创建它。

__函数原型__

``` c++
int shmget(key_t key, size_t size,
           int shmflg);
``` 

__创建一个共享内存__

``` c++
key_t key;
int shmid;

key = ftok(path, 'R');
shmid = shmget(key, 1024, 0644 | IPC_CREAT);
```
其中0644为对共享的操作权限(rw-r--r--)

__使用shmat函数把一个共享内存区“attach”附加到一个进程上__


``` c++
void *shmat(int shmid, void *shmaddr, int shmflg);
\\\其中shmaddr 为特定的附加共享内存空间的地址，为0时操作系统自动分配
\\\shmflg 可以为SHM_RDONLY，则为只读

```

__当一个进程完成某个共享内存的使用时，使用shmdt函数，来断接这个内存区，但不删除共享内存区__

``` c++
int shmdt(void *shmaddr);
```

__使用shmctl函数删除，共享内存区__

``` c++
shmctl(shmid, IPC_RMID, NULL);
```

__注意使用共享区时，要注意操作权限的匹配，低一级的权限可以访问，比它高的共享区，但是高一级的权限无法访问，比它低一级的共享区。__


具体底层内存见《深入理解linux内涵：第19章》


## Reference
《深入理解linux内核：第19章》

[Unix 编程例子](http://mij.oltrelinux.com/devel/unixprg/#regex)

[beej guide](http://beej.us/guide/bgipc/output/html/singlepage/bgipc.html#pipefork)

[推荐的中文博客](http://blog.csdn.net/yang_yulei/article/details/19775933)
