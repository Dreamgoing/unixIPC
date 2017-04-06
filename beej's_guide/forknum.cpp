//
// Created by 王若璇 on 17/4/5.
//

#include <iostream>
#include <cstdio>

using namespace std;

int main(){
    for(int i = 0;i<2;i++){
        pid_t  pid = fork();
        if(pid==-1){
            cout<<"error "<<endl;
        } else if(pid==0){
            cout<<"child: "<<getppid()<<" -> "<<getpid()<<" "<<pid<<endl;
//            wait(NULL);
        } else{
            cout<<"parent: "<<getppid()<<" -> "<<getpid()<<" "<<pid<<endl;
        }
    }
    return 0;
}