# Multithreading

See Also:

 - [Linux](Linux.md) 
 - [Mutex](Mutex.md) 
 - [Semaphore](Semaphore.md) 

---

Long and nice discussion on locks, mutexes, semaphores, etc:
https://stackoverflow.com/questions/2332765/lock-mutex-semaphore-whats-the-difference


- What should the acquire()/release() be called? -- [Varies massively]
- Does your lock/semaphore use a "queue" or a "set" to remember the threads waiting?
- Can your lock/semaphore be shared with threads of other processes?
- Is your lock "reentrant"? -- [Usually yes].
- Is your lock "blocking/non-blocking"? -- [Normally non-blocking are used as blocking locks (aka spin-locks) cause busy waiting].
- How do you ensure the operations are "atomic"?

---

Basic usage, from my sandbox https://github.com/panchul/sb_cpp :

    // $ g++ -std=c++1z thread_args.cpp -lpthread
    #include <iostream>
    #include <thread>
    #include <mutex>
    using namespace std;
    void tfunc(int aaa, char bbb, string sss) {
        cout << "aaa " << aaa << " bbb " << bbb << " sss " << sss << "\n";
    }
    int main() {
            thread a(tfunc, 1,'3', "govno1" ), b(tfunc, 2, '7', "govno2");
            a.join();
            b.join();
            return 0;
    }

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
  
void* thread(void* arg) { 
    //wait 
    sem_wait(&mysem); 
    printf("\nEntered..\n"); 
  
    //critical section 
    sleep(4); 
      
    //signal 
    printf("\nJust Exiting...\n"); 
    sem_post(&mysem); 
} 
int main() { 
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

```
// baseline is from here: http://www.cplusplus.com/reference/mutex/mutex/
// $ g++ -std=c++1z mutex_trylock.cpp -lpthread 
#include <iostream>       // std::cout
#include <thread>         // std::thread
#include <mutex>          // std::mutex

volatile int counter (0); // non-atomic counter
std::mutex mtx;           // locks access to counter

void attempt_10k_increases () {
  for (int i=0; i<10000; ++i) {
    if (mtx.try_lock()) {   // only increase if currently not locked:
      ++counter;
      mtx.unlock();
    }
  }
}

int main () {
  std::thread threads[10];
  // spawn 10 threads:
  for (int i=0; i<10; ++i)
    threads[i] = std::thread(attempt_10k_increases);

  for (auto& th : threads) th.join();
  std::cout << counter << " successful increases of the counter.\n";

  return 0;
}
```

---

Futures

    #include <future>
    #include <iostream>
    using namespace std;
    void func1() {
        this_thread::sleep_for(chrono::seconds(1));
    }

    int main()
    {
        auto f = async([](){return 3;});
        cout << f.get();
    }

---