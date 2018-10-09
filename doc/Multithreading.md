
## UNDER CONSTRUCTION

# Multithreading

See Also:

 - [Linux](Linux.md) 



---

Mutex member functions:

- (constructor) Construct mutex (public member function )
- lock() Lock mutex (public member function )
- try_lock () Lock mutex if not locked (public member function )
- unlock() Unlock mutex (public member function )
- native_handle() Get native handle (public member function )

Mutex example from my sandbox https://github.com/panchul/sb_cpp :

    #include <iostream>
    #include <thread>
    #include <mutex>

    std::mutex mtx;

    void print_block (int n, char c) {
      mtx.lock();
      for (int i=0; i<n; ++i) { std::cout << c << '\n'; }
      std::cout << '\n';
      mtx.unlock();
    }

    int main ()
    {
      std::thread th1 (print_block,50,'1');
      std::thread th2 (print_block,50,'2');

      th1.join();
      th2.join();

      return 0;
    }

When run, it prints neatly columns of '1' and '2' with no interlacing.

---

Monitors
https://en.wikipedia.org/wiki/Monitor_(synchronization)

---

Semaphore
https://en.wikipedia.org/wiki/Semaphore_(programming)

---

Semaphore example:


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