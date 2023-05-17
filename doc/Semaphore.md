# Samaphore

See Also:

 - [Linux](Linux.md) 
 - [Mutex](Mutex.md) 

Semaphore
https://en.wikipedia.org/wiki/Semaphore_(programming)

---

**Contents**

- [Miscellaneous](Semaphore.md#miscellaneous)

---

## Miscellaneous

---

Semaphore example from my sandbox:

```
#include <stdio.h> 
#include <pthread.h> 
#include <semaphore.h> 
#include <unistd.h> 
  
sem_t mysem; 
  
void* thread(void* arg) 
{ 
    //wait 
    sem_wait(&mysem); 
    printf("\nEntered..\n"); 
  
    //critical section 
    sleep(4); 
      
    //signal 
    printf("\nJust Exiting...\n"); 
    sem_post(&mysem); 
} 
  
  
int main() 
{ 
    sem_init(&mysem, 0, 1); 
    pthread_t t1,t2; 
    pthread_create(&t1,NULL,thread,NULL); 
    sleep(2); 
    pthread_create(&t2,NULL,thread,NULL); 
    pthread_join(t1,NULL); 
    pthread_join(t2,NULL); 
    sem_destroy(&mysem); 
    return 0; 
} 
```

---
