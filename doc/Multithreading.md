
## UNDER CONSTRUCTION

# Multithreading

See Also:

 - [STL](STL.md) 



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