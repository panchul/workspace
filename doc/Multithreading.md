[Home](Readme.md)
# Multithreading

See Also:

 - [Linux](Linux.md) 
 - [Mutex](Mutex.md) 
 - [Semaphore](Semaphore.md) 

---

**Contents**

- [Refresher of C++ basics](Multithreading.md#refresher-of-c-basics)
- [Miscellaneous](Multithreading.md#miscellaneous)

---

## Refresher of C++ basics

---
```
- std::mutex
  try_lock
  unlock()

- std::unique_ptr<>
  std::make_unique<>()

- std::shared_ptr<>
  std::make_shared<>()

- std::thread

- std::condition_variable
  notify_one()
  notify_all()
  wait()

- std::lock_guard<std::mutex>

- std::move()

- std::future
  wait_for()
```
---

## Miscellaneous

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

    // on Mac this worked:
    // $ g++ -std=c++1z futures.cpp
//
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

Print out:

    $ g++ -std=c++17 async.cpp
    $ ./a.out
    The sum is 10000
    world!
    43
    Hello 42
    53

The code itself:

    #include <iostream>
    #include <vector>
    #include <algorithm>
    #include <numeric>
    #include <future>
    #include <string>
    #include <mutex>
    
    std::mutex m;
    struct X {
      void foo(int i, const std::string& str) {
        std::lock_guard<std::mutex> lk(m);
        std::cout << str << ' ' << i << '\n';
      }
      void bar(const std::string& str) {
        std::lock_guard<std::mutex> lk(m);
        std::cout << str << '\n';
      }
      int operator()(int i) {
        std::lock_guard<std::mutex> lk(m);
        std::cout << i << '\n';
        return i + 10;
      }
    };
    
    template <typename RandomIt>
    int parallel_sum(RandomIt beg, RandomIt end)
    {
      auto len = end - beg;
      if (len < 1000)
        return std::accumulate(beg, end, 0);
    
      RandomIt mid = beg + len/2;
      auto handle = std::async(std::launch::async,
                                 parallel_sum<RandomIt>, mid, end);

      int sum = parallel_sum(beg, mid);
      return sum + handle.get();
    }
    
    int main()
    {
        std::vector<int> v(10000, 1);
        std::cout << "The sum is " << parallel_sum(v.begin(), v.end()) << '\n';
    
        X x;
        // Calls (&x)->foo(42, "Hello") with default policy:
        // may print "Hello 42" concurrently or defer execution
        auto a1 = std::async(&X::foo, &x, 42, "Hello");
        // Calls x.bar("world!") with deferred policy
        // prints "world!" when a2.get() or a2.wait() is called
        auto a2 = std::async(std::launch::deferred, &X::bar, x, "world!");
        // Calls X()(43); with async policy
        // prints "43" concurrently
        auto a3 = std::async(std::launch::async, X(), 43);
        a2.wait();                     // prints "world!"
        std::cout << a3.get() << '\n'; // prints "53"
    } // if a1 is not done at this point, destructor of a1 prints "Hello 42" here

---
